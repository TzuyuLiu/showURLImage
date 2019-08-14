//
//  UnsplashStruct.swift
//  Top20Pictures
//
//  Created by 劉子瑜 on 2019/8/13.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import Foundation


struct info: Codable {
    var first_name: String
}

struct link: Codable{
    var regular: URL
}

struct Photos: Codable {
    var created_at: String
    var alt_description: String?
    var urls: link
    var user: info
}


