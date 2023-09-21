//
//  MainRouter.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import UIKit

class MainRouter: MainRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let client = APIMainClient()
        
        let view = MainVC()
        let interactor = MainInteractor(client: client)
        let presenter = MainPresenter()
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    // MARK: Presenter to Router
    func pushToDetailScreen(navigationController: UINavigationController?, promo: Promo) {
        let detailModule = DetailRouter.createModule(promo)
        navigationController?.pushViewController(detailModule, animated: true)
        
    }
}

protocol MainRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func pushToDetailScreen(navigationController: UINavigationController?, promo: Promo)
}
