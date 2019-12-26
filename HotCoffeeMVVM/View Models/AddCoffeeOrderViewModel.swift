//
//  AddCoffeeOrderViewModel.swift
//  HotCoffeeMVVM
//
//  Created by Agnes Lo on 2019/12/26.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var types: [String] {
        
        return CoffeeType.allCases.map({ $0.rawValue.capitalized })
    }
    
    var sizes: [String] {
        
        return CoffeeSize.allCases.map({ $0.rawValue.capitalized })
    }
}
