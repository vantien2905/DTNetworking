//
//  Network.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire

/***
 Input: endPoint (all info to request)
 Ouput: BaseResponse or error
 ***/

public protocol APINetworkProtocol {
    func requestData(endPoint: EndPointType,
                     success: @escaping NetworkSuccess,
                     failure: @escaping RequestFailure)
}

public struct APINetwork: APINetworkProtocol {
    let request: NetworkRequestProtocol

    public init(request: NetworkRequestProtocol) {
        self.request = request
    }

    public func requestData(endPoint: EndPointType,
                     success: @escaping NetworkSuccess,
                     failure: @escaping RequestFailure) {
        request.requestData(endPoint: endPoint, success: { data in
            let json = JSON(data)
            if let result = Mapper<BaseResponse>().map(JSONObject: json.dictionaryObject) {
                if result.data == nil && result.message == nil && result.status == nil {
                    let response = BaseResponse(data: json.rawValue)
                    success(response)
                } else {
                    handleResponse(response: result, success: success, failure: failure)
                }
            } else {
                let response = BaseResponse(data: json.rawValue)
                success(response)
            }
        }) { error in
            failure(APIError(error: error))
        }
    }
}

// handle base response
extension APINetwork {
    private func handleResponse(response: BaseResponse,
                                success: @escaping NetworkSuccess,
                                failure: @escaping RequestFailure) {
        if response.data != nil || response.message == nil {
            success(response)
        } else {
            // handle error with message from API
            let error = APIError(baseResponse: response)
            failure(error)
        }
    }
}
