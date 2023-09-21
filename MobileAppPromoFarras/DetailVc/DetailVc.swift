//
//  DetailVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import UIKit

class DetailVc: UIViewController {
    
    let promo: Promo
    
    init(_ promo: Promo) {
        self.promo = promo
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
