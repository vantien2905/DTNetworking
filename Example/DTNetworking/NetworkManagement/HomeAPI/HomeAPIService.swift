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
    func getUniversities(country: String,
        success: @escaping SuccessHandler<UniversityEntity>.array,
        failure: @escaping RequestFailure)
    
    func getEntries(
        success: @escaping SuccessHandler<EntriesEntity>.object,
        failure: @escaping RequestFailure)
}

class HomeAPIService: BaseAPIService, HomeAPIServiceProtocol {
    
    func getUniversities(country: String,
        success: @escaping SuccessHandler<UniversityEntity>.array,
        failure: @escaping RequestFailure) {
        let endPoint = HomeEndPoint.getUniversities(country: country)
        network.requestData(endPoint: endPoint,
                            success: MapperData.mapArray(success),
                            failure: failure)
    }
    
    func getEntries(
        success: @escaping SuccessHandler<EntriesEntity>.object,
        failure: @escaping RequestFailure) {
            let endPoint = HomeEndPoint.getEntries
            network.requestData(endPoint: endPoint,
                                success: MapperData.mapObject(success),
                                failure: failure)
        }
}
