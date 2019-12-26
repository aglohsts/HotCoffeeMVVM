//
//  OrderViewModel.swift
//  HotCoffeeMVVM
//
//  Created by Agnes Lo on 2019/12/25.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

struct OrderViewModel {
    
    let order: Order
}

extension OrderViewModel {
    
    var name: String {
        
        return self.order.name
    }
    
    var email: String {
        
        return self.order.email
    }
    
    var type: String {
        
        return self.order.type.rawValue.capitalized
    }
}
