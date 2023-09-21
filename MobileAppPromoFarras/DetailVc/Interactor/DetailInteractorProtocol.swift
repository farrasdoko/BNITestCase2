//
//  DetailInteractorProtocol.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    
    // MARK: Presenter to Interactor
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
}
