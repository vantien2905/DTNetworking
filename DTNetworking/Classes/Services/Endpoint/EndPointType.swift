//
//  EndPointType.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import Alamofire

public protocol EndPointType {
    var baseURL: URL? { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters { get }
    var headers: HTTPHeaders? { get }
}

public struct DefaultHeader {
    public init () {
        
    }
    public func addAuthHeader() -> [String: String] {
        let header: [String: String] = ["Content-Type": "application/json"]
        return header
    }
}
