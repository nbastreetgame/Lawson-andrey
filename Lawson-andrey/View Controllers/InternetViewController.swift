import UIKit

class InternetViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 10, left: 0, bottom: 10, right: 0)
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        
        return collectionView
    }()
    
    
    private let array: [String] = ["space","","","","","","","",]
    
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
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 129)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
               ])
        
        backgroundColor = .red
        layer.cornerRadius = 4
        layer.maskedCorners = [.layerMinXMinYCorner]
        alpha = 0
    }
    
    func configure(with image: UIImage?) {
            imageView.image = image
      
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
