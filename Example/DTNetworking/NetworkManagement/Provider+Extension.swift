//
//  Provider.swift
//  DTNetworking_Example
//
//  Created by Tien Dinh on 07/08/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import DTNetworking

extension Provider {
    
    var homeAPIService: HomeAPIServiceProtocol {
        return HomeAPIService(network: networkManager)
    }
}
