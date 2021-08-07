//
//  Provider.swift
//  DTNetworking
//
//  Created by Tien Dinh on 07/08/2021.
//

import Foundation

open class Provider {
    
    public static let shared = Provider()
    
    private let request: NetworkRequestProtocol = NetworkRequest()
    
    public var networkManager: APINetworkProtocol {
        return APINetwork(request: request)
    }
    
    private init() {
        
    }
}
