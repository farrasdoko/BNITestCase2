//
//  PromoCell.swift
//  MobileAppPromoFarras
//
//  Created by Farras on 21/09/23.
//

import UIKit

class PromoCell: UITableViewCell {
    
    let imgBannerView = UIImageView()
    static let reuseIdentifier = "PromoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Use another initializer.")
    }
    
    private func setupSubviews() {
        imgBannerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imgBannerView)

        NSLayoutConstraint.activate([
            imgBannerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imgBannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imgBannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imgBannerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
