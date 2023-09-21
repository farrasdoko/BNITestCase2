//
//  MainInteractor.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    var client: MainClient { get }
    
    // MARK: Presenter to Interactor
    func fetchPromo()
}

class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol?
    var client: MainClient
    
    init(presenter: MainPresenterProtocol? = nil, client: MainClient) {
        self.presenter = presenter
        self.client = client
    }
    
    func fetchPromo() {
        client.fetchPromo { [weak presenter] data in
            presenter?.fetchPromoSuccess(with: data)
        }
    }
}
