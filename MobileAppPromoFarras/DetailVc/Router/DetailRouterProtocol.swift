//
//  DetailRouterProtocol.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(_ promo: Promo) -> UIViewController {
        let view = DetailVc(promo)
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    // MARK: Presenter to Router
}

protocol DetailRouterProtocol: AnyObject {
    static func createModule(_ promo: Promo) -> UIViewController
}
