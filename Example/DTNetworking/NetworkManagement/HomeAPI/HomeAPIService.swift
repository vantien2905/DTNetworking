//
//  HomeAPIService.swift
//  DTNetworking_Example
//
//  Created by Tien Dinh on 07/08/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import DTNetworking

protocol HomeAPIServiceProtocol {
    func getListCoin(
        success: @escaping SuccessHandler<CoinEntity>.array,
        failure: @escaping RequestFailure)
}

class HomeAPIService: BaseAPIService, HomeAPIServiceProtocol {
    
    func getListCoin(
        success: @escaping SuccessHandler<CoinEntity>.array,
        failure: @escaping RequestFailure) {
        let endPoint = HomeEndPoint.getListCoint
        network.requestData(endPoint: endPoint,
                            success: MapperData.mapArray(success),
                            failure: failure)
    }
}
