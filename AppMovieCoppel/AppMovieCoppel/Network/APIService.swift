//
//  APIService.swift
//  AppMovieCoppel
//
//  Created by osvaldo cespedes on 22/02/23.
//

import Foundation

class APIService {
    
    static var shared: APIService {
        return APIService()
    }
    init() {
    }
}

extension APIService {
    func apiRequest<model: Decodable>(_ endpoint: String,
                                     _ model : model.Type?,
                                     _ methodType: HTTPMethod = .get,
                                     _ parameters: [String: Any]? = [:],
                                     _ headers: [String: Any]? = [:],
                                     completion: @escaping (Result<model, NSError>) -> Void) {
        guard InternetConnectionManager.isConnectedToNetwork() else {
            return completion(.failure(NSError().loadErrorGeneric(message: Localizable.text(.withoutInternet))))
        }
        let urlString = "\(Setting.baseGateway)/\(endpoint)"
        guard let urlRequest:URLRequest = self.createRequest(url: urlString,
                                                             method: methodType,
                                                             parameters: parameters,
                                                             headers: headers) else {
            return completion(.failure(NSError().loadErrorGeneric(message: Localizable.text(.serviceNotAvailable))))
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            self.printRequest(urlRequest: urlRequest,
                              data: data,
                              error: error?.localizedDescription)
            guard let safeData = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                return completion(.failure(error as NSError? ?? NSError().loadErrorGeneric(message: Localizable.text(.serviceNotAvailable))))
            }
            guard (200 ... 299) ~= response.statusCode else {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CPErrorLogin.self, from: safeData)
                    return completion(.failure(NSError().loadErrorGeneric(message: result.statusMessage)))
                } catch let errorCodable {
                    print(errorCodable)
                    return completion(.failure(NSError().loadErrorGeneric(message: Localizable.text(.serviceNotAvailable))))
                }
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(model!.self, from: safeData)
                return completion(.success(result))
            } catch let errorCodable {
                print(errorCodable)
                return completion(.failure(NSError().loadErrorGeneric(message: Localizable.text(.serviceNotAvailable))))
            }
        }.resume()
    }
}

extension APIService {
    
    private func createRequest(url: String,
                               method: HTTPMethod,
                               parameters: [String: Any]? = [:],
                               headers: [String: Any]? = [:]) -> URLRequest? {
        guard let api = URL(string: url) else {
            return nil
        }
        var request = URLRequest(url: api)
        request.httpMethod = method.rawValue
        if let headers = headers as? [String: String],  headers.count > 0 {
            request.allHTTPHeaderFields = headers
        } else {
            request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json" ] as [String:String]
        }
        request.timeoutInterval = 360
        if let parameters = parameters,
           parameters.count > 0 {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .fragmentsAllowed)
        }
        return request
    }
    
    private func printRequest(urlRequest: URLRequest,
                              data: Data?,
                              error: String?) {
        
        guard Setting.activePrintRequest else {
            return
        }
        
        debugPrint("-------- REQUEST INFORMATION --------------")
        debugPrint("URL: \(urlRequest.url!)")
        debugPrint("METHOD: \(String(describing: urlRequest.httpMethod))")
        debugPrint("Request Header: \(String(describing: urlRequest.allHTTPHeaderFields))")
        
        if let body = urlRequest.httpBody,
           let strbody = NSString(data: body, encoding: String.Encoding.utf8.rawValue) {
            debugPrint("Request Params: \(strbody)")
        }
        
        if let data = data {
            do {
                // make sure this JSON is in the format we expect
                // convert data to json
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // try to read out a dictionary
                    debugPrint("Response: \(json)")
                }
            } catch let error as NSError {
                debugPrint("Failed to load: \(error.localizedDescription)")
            }
        }
        
        if let error = error {
            debugPrint("Error: \(error)")
        }
    }
    
}

