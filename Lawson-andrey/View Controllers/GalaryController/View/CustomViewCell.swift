import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
           let imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.clipsToBounds = true
           imageView.layer.cornerRadius = 4
           return imageView
       }()
    
    private let checkmarkImageView: UIImageView = {
           let imageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
           imageView.tintColor = .systemOrange
           imageView.isHidden = true
           return imageView
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(checkmarkImageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        checkmarkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
        checkmarkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        checkmarkImageView.widthAnchor.constraint(equalToConstant: 24),
        checkmarkImageView.heightAnchor.constraint(equalToConstant: 24)
               ])
        
        backgroundColor = .systemPink.withAlphaComponent(0.4)
        layer.cornerRadius = 4
        alpha = 0
        layer.borderColor =  UIColor.systemOrange.cgColor
       
    }
    
    func configure(with image: UIImage?, isSelect: Bool) {
            imageView.image = image
        checkmarkImageView.isHidden = !isSelect
        
       
        layer.borderWidth = isSelect ? 2 : 0
      
        }
    
    func configure( isSelect: Bool) {
        checkmarkImageView.isHidden = !isSelect
          
        layer.borderWidth = isSelect ? 2 : 0
      
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
