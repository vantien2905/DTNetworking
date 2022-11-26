//
//  CoinEntity.swift
//  DTNetworking_Example
//
//  Created by Tien Dinh on 07/08/2021.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class UniversityEntity: Mappable {
    
    var country: String?
    var domains: [String]?
    var web_pages: [String]?
    var alpha_two_code: String?
    var name: String?
    var state: String?
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.country <- map["country"]
        self.domains <- map["domains"]
        self.web_pages <- map["web_pages"]
        self.alpha_two_code <- map["alpha_two_code"]
        self.name <- map["name"]
        self.state <- map["state"]
    }
}

class EntriesEntity: Mappable {
    
    var count: Int?
    var entries: [EntryEntity] = []
   
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.count <- map["count"]
        self.entries <- map["entries"]
    }
}

class EntryEntity: Mappable {
    
    var API: String?
    var Description: String?
    var Auth: String?
    var HTTPS: Bool = false
    var Cors: String?
    var Link: String?
    var Category: String?
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        self.API <- map["API"]
        self.Description <- map["Description"]
        self.Auth <- map["Auth"]
        self.HTTPS <- map["HTTPS"]
        self.Cors <- map["Cors"]
        self.Link <- map["Link"]
        self.Category <- map["Category"]
    }
}
