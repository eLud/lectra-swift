//
//  SelectionViewController.swift
//  Shopif
//
//  Created by Ludovic Ollagnier on 09/09/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildUI()
    }
    
    private func buildUI() {
        
        // Button init
        let clientButton = UIButton()
        clientButton.setTitle("Client", for: .normal)
        clientButton.backgroundColor = .systemBackground
        clientButton.setTitleColor(.label, for: .normal)
        clientButton.layer.cornerRadius = 8.0
        
        clientButton.addTarget(self, action: #selector(showClient), for: .touchUpInside)
        
        let shopButton = UIButton()
        shopButton.setTitle("Shop", for: .normal)
        shopButton.backgroundColor = .systemBackground
        shopButton.setTitleColor(.label, for: .normal)
        shopButton.layer.cornerRadius = 8.0

        shopButton.addTarget(self, action: #selector(showShop), for: .touchUpInside)

        // Stack view embedded views
        let stackView = UIStackView(arrangedSubviews: [clientButton, shopButton])
        stackView.axis = .vertical
        stackView.spacing = 30.0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        // Disable autoresizing mask!
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        blurView.contentView.addSubview(stackView)
        
        // Constraints
        stackView.centerYAnchor.constraint(equalTo: blurView.contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: blurView.contentView.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: blurView.widthAnchor, multiplier: 0.8).isActive = true
        stackView.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.3).isActive = true
    }

    @objc private func showClient() {
        performSegue(withIdentifier: "clientSegue", sender: nil)
    }
    
    @objc private func showShop() {
        
//        self.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let shopController = storyboard.instantiateViewController(identifier: "ShopViewController") as? ShopViewController else {
            fatalError("Oups")
        }
        
        let navController = UINavigationController(rootViewController: shopController)
//        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }

}

