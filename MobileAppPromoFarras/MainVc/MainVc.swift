//
//  MainVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 20/09/23.
//

import UIKit

class MainVC: UIViewController {
    
    private let tableView = UITableView()
    var promosData: [Promo] = []
    private let promoCellIdentifier = "PromoCell"
    
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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: promoCellIdentifier)
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        promosData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: promoCellIdentifier)!
        
        var content = cell.defaultContentConfiguration()
        content.text = promosData[indexPath.row].nama
        content.secondaryText = promosData[indexPath.row].desc
        
        cell.contentConfiguration = content
        return cell
    }
}
