//
//  Promo.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import Foundation

struct Promo: Codable {
    let id: Int
    let nama: String
    let desc: String
    let img: PromoImg
}

struct PromoImg: Codable {
    let url: String
}
