//
//  BaseAPIService.swift
//  DTNetworking
//
//  Created by Tien Dinh on 07/08/2021.
//

import Foundation

open class BaseAPIService {
    
    public let network: APINetworkProtocol
    
    public init(network: APINetworkProtocol) {
        self.network = network
    }
}
