//
//  ClientViewController.swift
//  Shopif
//
//  Created by Ludovic on 10/09/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class ClientViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")

        ProductsServices.shared.fetch { (products) in
            DispatchQueue.main.async {
                self.products = products
                self.collectionView.reloadData()
            }
        }
    }
}

extension ClientViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCell", for: indexPath)
        
        let currentProduct = products[indexPath.item]
        print(currentProduct)
        
        return cell
    }
}

extension ClientViewController: UICollectionViewDelegate {
    
}
