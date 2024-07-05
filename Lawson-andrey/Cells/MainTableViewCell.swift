//
//  MainTableViewCell.swift
//  Lawson-andrey
//
//  Created by Apple on 19.06.2024.
//

import UIKit

class MainTableViewCell:UITableViewCell {
    
    private let titleWord: UILabel = UILabel()
    private let detailWordLabel: UILabel = UILabel()
    private  let playImageView = UIImageView(image: UIImage(systemName: "play.circle"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleWord)
        self.contentView.addSubview(detailWordLabel)
        self.contentView.addSubview(playImageView)
        
        titleWord.translatesAutoresizingMaskIntoConstraints = false
        detailWordLabel.translatesAutoresizingMaskIntoConstraints = false
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
titleWord.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
titleWord.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),

            
detailWordLabel.topAnchor.constraint(equalTo: titleWord.bottomAnchor, constant: 3),
detailWordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
detailWordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
playImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
playImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
playImageView.widthAnchor.constraint(equalToConstant: 24),
playImageView.heightAnchor.constraint(equalToConstant: 24),
playImageView.leadingAnchor.constraint(greaterThanOrEqualTo: titleWord.trailingAnchor, constant: 10),
playImageView.leadingAnchor.constraint(greaterThanOrEqualTo: detailWordLabel.trailingAnchor, constant: 10)
            
        ])
        titleWord.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        detailWordLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        
        playImageView.tintColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(title:String,detail:String){
        titleWord.text = title
        detailWordLabel.text = detail
        
    }
}
