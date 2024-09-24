import UIKit

class InternetViewController: UIViewController {
    
    private let searchBar = UISearchBar()
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
      
        
        setupSearchBar()
        setupBarConstraints()
        setupTitleLabel()
        setupLabelConstraint()
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Поиск"
        searchBar.layer.cornerRadius = 12
        searchBar.clipsToBounds = true
       
       
        
        view.addSubview(searchBar)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Выберите изображение"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        view.addSubview(titleLabel)
    }
    
    private func setupLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            titleLabel.heightAnchor.constraint(equalToConstant: 41),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 92),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -92),
        ])
    }
    
    private func setupBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 98),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 9),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            searchBar.heightAnchor.constraint(equalToConstant: 44),
            searchBar.widthAnchor.constraint(equalToConstant: 353)
            
        ])
     
    }
    
}





#Preview() {
    InternetViewController()
}
