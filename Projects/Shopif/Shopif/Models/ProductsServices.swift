//
//  ProductsServices.swift
//  Shopif
//
//  Created by Ludovic on 10/09/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

class ProductsServices {
    
    static let shared = ProductsServices()
    var products: [Product]
    
    private init() {
        products = []
    }
    
    /// Fetchs the products from the network, then call the callback. Callback is executed on a background queue.
    /// - Parameter callback: Callback is executed on a background queue.
    func fetch(callback: @escaping ([Product])->()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            guard let url = Bundle.main.url(forResource: "brice", withExtension: "json") else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            let decoder = JSONDecoder()
            guard let products = try? decoder.decode([Product].self, from: data) else { return }
            self.products = products
            callback(products)
        }
    }
}
