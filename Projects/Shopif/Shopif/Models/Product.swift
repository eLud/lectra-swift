//
//  Product.swift
//  Shopif
//
//  Created by Ludovic on 10/09/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let metaTitle: String
    let metaImage: URL
    let metaUrl: URL
    let metaDescription: String
    let metaKeywords: String
    let categories: [String]
    let price: String
    let reference: String
    let title: String
    let colors: [String]
    let sizes: [String]
    let pictures: [URL]
}
