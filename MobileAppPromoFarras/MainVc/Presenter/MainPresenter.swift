//
//  MainPresenter.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import Foundation
import UIKit

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    // MARK: View to Presenter
    func viewDidLoad()
    func showDetailController(navigationController: UINavigationController?, promo: Promo)
    
    // MARK: Interactor to Presenter
    func fetchPromoSuccess(with promo: [Promo])
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchPromo()
    }
    
    func showDetailController(navigationController: UINavigationController?, promo: Promo) {
        router?.pushToDetailScreen(navigationController: navigationController, promo: promo)
    }
    
    func fetchPromoSuccess(with promo: [Promo]) {
        view?.showPromo(with: promo)
    }
}
