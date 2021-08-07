//
//  HomeEndPoint.swift
//  DTNetworking_Example
//
//  Created by Tien Dinh on 07/08/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Alamofire
import DTNetworking

enum HomeEndPoint {
    case getListCoint
}

extension HomeEndPoint: EndPointType {
    var baseURL: URL? {
        return URL(string: "https://www.coinhako.com/api/v3")
    }
    
    var path: String {
        switch self {
        case .getListCoint:
            return "/price/all_prices_for_mobile?counter_currency=USD"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getListCoint:
            return [:]
        }
    }
    
    var headers: HTTPHeaders? {
        return DefaultHeader().addAuthHeader()
    }
}

