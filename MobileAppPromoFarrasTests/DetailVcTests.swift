//
//  DetailVcTests.swift
//  MobileAppPromoFarrasTests
//
//  Created by Farras on 21/09/23.
//

import XCTest
@testable import MobileAppPromoFarras

final class DetailVcTests: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    override class func tearDown() {
        super.tearDown()
    }
    func testDetail() {
        let promo = Promo(id: 0, nama: "Nama Promo", desc: "Desc promo is the description of promo", img: PromoImg(url: "https://strapi-jkt-digi46.s3.ap-southeast-3.amazonaws.com/bni_credit_card_banner_fitur_mbanking_small_b8d822ed1c.jpg"))
        let detailVc = DetailVc(promo)
        XCTAssertEqual(promo, detailVc.promo)
    }
}

class DetailVc: UIViewController {
    
    let promo: Promo
    
    init(_ promo: Promo) {
        self.promo = promo
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
