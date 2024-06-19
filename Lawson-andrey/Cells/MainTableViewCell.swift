//
//  MainTableViewCell.swift
//  Lawson-andrey
//
//  Created by Apple on 19.06.2024.
//

import UIKit

class MainTableViewCell:UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
