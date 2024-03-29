//
//  BaseResponse.swift
//  DTNetworking
//
//  Created by Tien Dinh on 07/08/2021.
//

import Foundation
import ObjectMapper

// Base
open class BaseResponse: Mappable {
    open var status      : Int?
    open var message     : String?
    open var data        : Any?
    
    init(status: Int? = nil, message: String? = nil, data: Any? = nil) {
        self.status = status
        self.message = message
        self.data = data
    }

    required public init?(map: Map) {
        mapping(map: map)
    }

    public func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["error"]
        data        <- map["data"]
    }
}
