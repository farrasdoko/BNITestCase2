//
//  MainVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import UIKit

class MainVC: UIViewController {
    var promosData: [Promo] = []
    
    var client: MainClient
    
    init(client: MainClient) {
        self.client = client
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.fetchPromo { [weak self] promos in
            self?.promosData = promos
        }
    }
}
