//
//  APIError.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import UIKit

// MARK APPError
public struct APPError {
    static let canNotParseData = APIError(message: "Can Not Parse Data")
}

// MARK: APIError class
open class APIError: Error {
    public let code        : Int?
    public let message     : String?
    open var data        : Any? = nil

    public init(code: Int?, message: String?) {
        self.code = code
        self.message = message
    }

    public init(message: String?) {
        self.message = message
        self.code = nil
    }

    open var codeVerify: String {
        if let _json = data as? [String: String] {
            return _json["code_verify"] ?? ""
        }
        return ""
    }

    public init(baseResponse: BaseResponse) {
        self.code       = baseResponse.status
        self.message    = baseResponse.message
        self.data       = baseResponse.data
    }

    public init(error: Error?) {
        self.code       = nil
        self.message    = error?.localizedDescription ?? ""
    }
}
