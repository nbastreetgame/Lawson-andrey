import UIKit

protocol InternetViewControllerDelegate: AnyObject {
    func selectImage(_ image: UIImage)
}

class InternetViewController: UIViewController {
    weak var delegate: InternetViewControllerDelegate?
    
    private let presenter: InternetPresenter = .init()
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
    
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 244 / 255, alpha: 1)
      
        setupConstraints()
        setupView()
        setupNavigationView()
        
        presenter.view = self
        presenter.setupViewDidLoad()
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
        
        navigationItem.rightBarButtonItem = .init(title: "Сохранить", style: .plain, target: self, action: #selector(saveImage))
    }
    @objc private func saveImage() {
        presenter.saveImage()
    }
}

extension InternetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  presenter.arrayPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath) as? CustomCollectionViewCell else { return .init()}
        
        let isOn = indexPath == presenter.isSelectedCell
        
        let value = presenter.arrayPhotos[indexPath.row].name
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
        
        if presenter.isSelectedCell == indexPath { return }
          
        if presenter.isSelectedCell == nil {
            presenter.isSelectedCell = indexPath
            cell.configure( isSelect: true)
          
            return
        }
        
        cell.configure( isSelect: true)
        
guard let cellOld = collectionView.cellForItem(at: presenter.isSelectedCell) as? CustomCollectionViewCell else {
        presenter.isSelectedCell = indexPath
        return }
        
        presenter.isSelectedCell = indexPath
        cellOld.configure( isSelect: false)
        
    }
    
}
  
extension InternetViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}


extension InternetViewController : InternetPresenterProtocol {
    
    func saveImageSelectName(_ name: String) {
        guard let image = UIImage(named: name) else { return }
        delegate?.selectImage(image)
        navigationController?.popViewController( animated: true)
    }
    
    func reloadData() {
        collectionView.reloadData()
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


