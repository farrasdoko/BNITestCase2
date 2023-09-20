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

protocol MainClient {
    func fetchPromo(completion: ([Promo]) -> Void)
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

struct Promo {
    var id: String
    var nama: String
}

class MainVC: UIViewController {
    var promosData: [Promo] = []
    
    var client: MainClient
    
    init(client: MainClient) {
        self.client = client
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.fetchPromo { [weak self] promos in
            self?.promosData = promos
        }
    }
}
