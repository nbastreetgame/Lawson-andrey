import UIKit

class InternetViewController: UIViewController {
    
    private let spacing: CGFloat = 10.0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        return collectionView
    }()
    
    
    private let array: [String] = ["space","","","","","","","",]
    private var isSelectedCell: IndexPath! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 244 / 255, alpha: 1)
      
        setupConstraints()
        setupView()
        setupNavigationView()
    }
    
    private func setupConstraints() {
       
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate ([
           
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    private func setupView(){
       
        
        navigationItem.title = "Выберите изображение"
       
        if let topItem = navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = .init(title: "", style: .done, target: nil, action: nil)
    }
}
    private func setupNavigationView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.searchController = .init()
        navigationItem.searchController?.searchBar.placeholder = "Поиск"
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension InternetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as? CustomCollectionViewCell else { return .init()}
        
        let isOn = indexPath == isSelectedCell
        
        let value = array[indexPath.row]
        cell.configure(with: UIImage(named: value), isSelect: isOn)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let countCell = 3.0
        
      //сумма отступов + ширина всех ячеек = ширина всего контроллера
        let sumCell = width - (countCell + 1) * spacing - 1
        let widhtCell = sumCell / countCell
        
        let height = 129.0 * widhtCell / 111.0
        
        return CGSize(width: widhtCell, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
guard let cell = collectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell else { return }
        
        if isSelectedCell == indexPath { return }
          
        if isSelectedCell == nil {
            isSelectedCell = indexPath
            cell.configure( isSelect: true)
          
            return
        }
        
        cell.configure( isSelect: true)
        
    guard let cellOld = collectionView.cellForItem(at: isSelectedCell) as? CustomCollectionViewCell else {
        isSelectedCell = indexPath
        return }
        
        isSelectedCell = indexPath
        cellOld.configure( isSelect: false)
        
    }
    
}
  
extension InternetViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

#Preview() {
    
    let apperance = UINavigationBarAppearance()
    apperance.configureWithDefaultBackground()
    apperance.titleTextAttributes = [
        .font: UIFont.systemFont(ofSize: 17, weight: .medium)
    ]
    
    let navigation = UINavigationController(rootViewController: InternetViewController())
    
    navigation.navigationBar.standardAppearance = apperance
    navigation.navigationBar.scrollEdgeAppearance = apperance
    navigation.navigationBar.compactAppearance = apperance
    navigation.navigationBar.tintColor = .systemOrange
   
    return navigation
    
}

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
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
