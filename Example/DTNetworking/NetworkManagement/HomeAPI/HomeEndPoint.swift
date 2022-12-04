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
    case getUniversities(country: String)
    case getEntries
}

extension HomeEndPoint: EndPointType {
    var baseURL: URL? {
        return URL(string: "")
    }
    
    var path: String {
        switch self {
        case .getUniversities:
            return "http://universities.hipolabs.com/search"
        case .getEntries:
            return "https://api.publicapis.org/entries"
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
        case .getUniversities(let country):
            return ["country": country]
        case .getEntries:
            return [:]
        }
    }
    
    var headers: HTTPHeaders? {
        return HTTPHeaders(DefaultHeader().addAuthHeader())
    }
}

