//
//  DSExtensions.swift
//  Daily Spell
//
//  Created by Ashish Kapoor on 29/06/17.
//  Copyright © 2017 Shopndo. All rights reserved.
//

import Foundation


extension URL {
    static func requestHeader(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(oxfordAppId, forHTTPHeaderField: "app_id")
        request.addValue(oxfordAppKey, forHTTPHeaderField: "app_key")
        return request
    }
}
