//
//  ImageCell.swift
//  project01
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {  fatalError("init(coder:) has not been implemented")  }
    
    fileprivate func setupViews() {
        addSubview(nameLabel)
        addConstraintsWithFormat("H:|[v0]|", views: nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
    }
}
