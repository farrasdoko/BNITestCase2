//
//  MobileAppPromoFarrasTests.swift
//  MobileAppPromoFarrasTests
//
//  Created by Farras on 20/09/23.
//

import XCTest
@testable import MobileAppPromoFarras

final class MobileAppPromoFarrasTests: XCTestCase {
    
    var vc: MainVC!
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testFetch10Data() {
        let client = SuccessMainClientStub()
        vc = MainVC(client: client)
        
        vc.loadViewIfNeeded()
        
        XCTAssertEqual(vc.promosData.count, 10)
    }
    
    func testFetchDataFailed() {
        let client = FailedMainClientStub()
        vc = MainVC(client: client)
        
        vc.loadViewIfNeeded()
        
        XCTAssertEqual(vc.promosData.count, 0)
    }
    
}

struct SuccessMainClientStub: MainClient {
    func fetchPromo(completion: ([Promo]) -> Void) {
        var promos: [Promo] = []
        for i in 0..<10 {
            let promo = Promo(id: "\(i)", nama: "Test Promo")
            promos.append(promo)
        }
        completion(promos)
    }
}

struct FailedMainClientStub: MainClient {
    func fetchPromo(completion: ([Promo]) -> Void) {
        let promos: [Promo] = []
        completion(promos)
    }
}
