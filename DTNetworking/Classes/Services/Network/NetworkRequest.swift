//
//  NetworkRequest.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

/***
 Input: endPoint (all info to request)
 Ouput: data or error
 ***/
import Alamofire
import UIKit
//---
public typealias RequestSuccess = (_ data: Data) -> Void
public typealias RequestFailure = (_ error: APIError?) -> Void

//---
public typealias NetworkSuccess = (_ data: BaseResponse ) -> Void

public let noInternet = APIError(code: 2000, message: "No Internet")

//---
public struct SuccessHandler<T> {
    public typealias object = (_ object: T?) -> Void
    public typealias array = (_ array: [T]) -> Void
    public typealias anyObject = (_ object: Any?) -> Void
}

// NetworkPotocol
public protocol NetworkRequestProtocol {
    func requestData(endPoint: EndPointType,
                     success: @escaping RequestSuccess,
                     failure: @escaping RequestFailure)
}

//---
public struct NetworkRequest: NetworkRequestProtocol {
    public init(){
        
    }
    public func requestData(endPoint: EndPointType,
                     success: @escaping RequestSuccess,
                     failure: @escaping RequestFailure) {

        var url: URL!
        if let baseUrl = endPoint.baseURL {
            url = baseUrl.appendingPathComponent(endPoint.path)
        } else {
            url = URL(string: endPoint.path)!
            print("Base URL Empty")
        }
        
        let encoding = getAlamofireEncoding(httpMethod: endPoint.httpMethod)
        
        let request = AF.request(url,
                                method      : endPoint.httpMethod,
                                parameters  : endPoint.parameters,
                                encoding    : encoding,
                                 headers     : endPoint.headers).cURLDescription { curl in
            print(curl)
        }
        request.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                let apiError = APIError(error: error)
                failure(apiError)
            }
        }
    }
}

// MARK: helper NetworkRequest
extension NetworkRequest {
    private func getAlamofireEncoding(httpMethod: HTTPMethod) -> ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        case .post:
            return JSONEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
