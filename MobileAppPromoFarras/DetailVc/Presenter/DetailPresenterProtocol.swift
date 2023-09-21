//
//  DetailPresenterProtocol.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    // MARK: View to Presenter
    func viewDidLoad(_ promo: Promo)
    
    // MARK: Interactor to Presenter
    
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    
    func viewDidLoad(_ promo: Promo) {
        view?.setupData(with: promo)
    }
}
