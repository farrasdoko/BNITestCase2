//
//  MainClient.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import Foundation

protocol MainClient {
    func fetchPromo(completion: ([Promo]) -> Void)
}
