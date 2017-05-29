//
//  ImageCell.swift
//  project03b
//
//  Created by LeeChan on 9/8/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import UIKit


class ImageCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ");
    }
    
    func setupView() {
        addSubview(nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
    }
}

