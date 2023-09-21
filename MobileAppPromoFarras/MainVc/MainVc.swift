//
//  MainVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import UIKit
import Kingfisher

class MainVC: UIViewController {
    
    private let tableView = UITableView()
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
        
        setupView()
        
        client.fetchPromo { [weak self] promos in
            self?.promosData = promos
            self?.tableView.reloadData()
        }
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
        
        let promo = promosData[indexPath.row]
        let vc = DetailVc(promo)
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.width * (298/825)
    }
}
