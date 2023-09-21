//
//  DetailVc.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import UIKit
import Kingfisher

class DetailVc: UIViewController {
    
    let imgView = UIImageView(frame: .zero)
    
    let promo: Promo
    
    init(_ promo: Promo) {
        self.promo = promo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupImageView()
        setupLabelView()
    }
    
    private func setupImageView() {
        let imgUrl = URL(string: promo.img.url)
        imgView.kf.setImage(with: imgUrl)
        
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 1 * (298/825)),
        ])
    }
    
    private func setupLabelView() {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = promo.nama
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        let descLabel = UILabel(frame: .zero)
        descLabel.text = promo.desc
        descLabel.font = .systemFont(ofSize: 15, weight: .regular)
        descLabel.numberOfLines = 0
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, descLabel])
        stack.spacing = 8
        stack.axis = .vertical
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant:  16),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16),
            stack.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 16),
        ])
    }
}
