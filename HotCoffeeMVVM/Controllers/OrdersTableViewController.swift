//
//  OrdersTableViewController.swift
//  HotCoffeeMVVM
//
//  Created by Agnes Lo on 2019/12/25.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        Webservice().load(resource: resource, completion: { (result) in
            
            switch result {
                
            case .success(let orders): print(orders)
                
            case .failure(let error): print(error)
            }
        })
    }
}
