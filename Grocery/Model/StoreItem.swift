//
//  StoreItem.swift
//  Grocery
//
//  Created by Luan.Lima on 20/01/24.
//

import Foundation

struct StoreItem: Codable {
    var id: String?
    var name = ""
    var price = 0.0
    var quantity = 0
    
}

extension StoreItem {
    
    static func from(_ storeItemVS: StoreItemViewState) -> StoreItem {
        return StoreItem(name: storeItemVS.name, price: Double(storeItemVS.price) ?? 0.0, quantity:
                            Int (storeItemVS.quantity) ?? 0)
        
    }
    
}
