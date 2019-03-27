//
//  HTTP.swift
//  DKExtensions
//
//  Created by Кузин Дмитрий on 27.03.2019.
//

import UIKit

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum HTTPEncoding {
    case json
    case formData
}

public typealias Parameters = [String : Any]

public class HTTP {
    
    typealias Success = ((_ json: AnyObject) -> Void)
    typealias Failure = ((_ error: Error) -> Void)
    
    public private (set) var requestsCount: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = self.requestsCount > 0
            }
        }
    }
//
//    private func execute(_ method: HTTPMethod = .get, urlString: String, params: Parameters? = nil, encoding: HTTPEncoding = .formData, success: Success? = nil, failure: Failure? = nil) {
//
//        var request = URLRequest(url: URL(string: urlString)!)
//        request.httpMethod = method.rawValue
//        if let parameters = params {
//            if encoding == .formData {
//
//            } else if encoding == .json {
//                let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//                request.httpBody = data
//            }
//        }
//
//        requestsCount += 1
//        let start = Date().timeIntervalSince1970
//
//        Alamofire.request(urlString, method: method, parameters: params, encoding: encoding, headers: craftHeaders(authorized: authorized)).responseData { (response) in
//            if let data = response.data {
//                print(String(data: data, encoding: .utf8)!)
//            }
//            self.requestsCount -= 1
//
//            if let r = response.response, let URL = response.request?.url?.absoluteString, let m = response.request?.httpMethod {
//                let timeDiffString = String(format: "%.4f", Date().timeIntervalSince1970-start)
//                #if !Share
//                Logger.verbose("\(r.statusCode) at \(m) \(URL): \(timeDiffString)")
//                #endif
//            }
//
//            if self.isValid(statusCode: response.response?.statusCode ?? 0) {
//                if let d = response.data, let json = try? JSONSerialization.jsonObject(with: d, options: []) {
//                    success?(json as AnyObject)
//                } else {
//                    success?([:] as AnyObject)
//                }
//            } else {
//                failure?(self.handleError(response: response, urlString: urlString, method: method))
//            }
//        }
//    }
    
//    func
    
}
