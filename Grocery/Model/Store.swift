//
//  Store.swift
//  Grocery
//
//  Created by Luan.Lima on 19/01/24.
//

import Foundation

struct Store: Codable {
    
    var id: String?
    let name: String
    let address: String
    var items: [String]?
    
}
