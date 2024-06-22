//
//  MainTableViewCell.swift
//  Lawson-andrey
//
//  Created by Apple on 19.06.2024.
//

import UIKit

class MainTableViewCell:UITableViewCell {
    private let titleWord: UILabel = UILabel()
    private let detealWordLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleWord)
        self.contentView.addSubview(detealWordLabel)
        
        titleWord.translatesAutoresizingMaskIntoConstraints = false
        detealWordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleWord.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleWord.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            titleWord.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            
        
            detealWordLabel.topAnchor.constraint(equalTo: titleWord.bottomAnchor, constant: 3),
            detealWordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            detealWordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            detealWordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
        ])
        
        
        titleWord.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        detealWordLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setuo(title: String, deteal: String) {
        titleWord.text = title
        detealWordLabel.text = deteal
    }
}
