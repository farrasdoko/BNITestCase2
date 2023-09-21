//
//  MainVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import UIKit
import Kingfisher

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    // MARK: Presenter to View
    func showPromo(with promo: [Promo])
}

class MainVC: UIViewController {
    
    var presenter: MainPresenterProtocol?
    
    private let tableView = UITableView()
    var promosData: [Promo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PromoCell.self, forCellReuseIdentifier: PromoCell.reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        promosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PromoCell.reuseIdentifier) as! PromoCell
        
        cell.imgBannerView.kf.setImage(with: URL(string: promosData[indexPath.row].img.url))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // TODO: Move to Router
        let promo = promosData[indexPath.row]
        presenter?.showDetailController(navigationController: navigationController, promo: promo)
//        let promo = promosData[indexPath.row]
//        let vc = DetailVc(promo)
//        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.width * (298/825)
    }
}

extension MainVC: MainViewProtocol {
    func showPromo(with promo: [Promo]) {
        promosData = promo
        tableView.reloadData()
    }
}
