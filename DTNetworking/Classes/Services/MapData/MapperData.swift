//
//  MapperData.swift
//  Vebrary
//
//  Created by DINH VAN TIEN on 5/2/19.
//  Copyright © 2019 DINH VAN TIEN. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

public struct MapperData {

    // MARK: MAP JSON OBJECT
    public static func mapObject<T: Mappable>(_ successHandler: @escaping SuccessHandler<T>.object) -> NetworkSuccess {
        return { baseResponse in
            if let obj = Mapper<T>().map(JSONObject: baseResponse.data) {
                successHandler(obj)
            } else {
                let res = Mapper<T>().map(JSONObject: baseResponse.toJSON())
                successHandler(res)
            }
        }
    }

    public static func mapArray<T: Mappable>(_ successHandler: @escaping SuccessHandler<T>.array) -> NetworkSuccess {
        return { baseResponse in
            let obj = Mapper<T>().mapArray(JSONObject: baseResponse.data)
            if let _obj = obj {
                successHandler(_obj)
            } else {
                if let noData = Mapper<T>().mapArray(JSONObject: baseResponse.toJSON()) {
                    successHandler(noData)
                } else {
                    successHandler([])
                }
            }
        }
    }

    public static func mapNoData<T: Mappable>(_ successHandler: @escaping SuccessHandler<T>.object) -> NetworkSuccess {
        return { baseResponse in
            let objResult = Mapper<T>().map(JSONObject: baseResponse.toJSON())
            successHandler(objResult)
        }
    }
}
