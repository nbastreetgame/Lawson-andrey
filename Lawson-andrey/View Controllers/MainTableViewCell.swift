//
//  MainTableViewCell.swift
//  Lawson-andrey
//
//  Created by Алмаз Рахматуллин on 24.05.2024.
//

import UIKit

class MainTableViewCell:UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
