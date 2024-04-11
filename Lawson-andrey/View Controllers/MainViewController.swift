//
//  MainViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 01.03.2024.
//

import UIKit

struct WordModel {
    let word:String
    let translate:String
}


class MainViewController: BaseViewController {
  
    private let tableView = UITableView(frame:.zero, style: .plain)
    
    private var arrayWords: [WordModel] = [WordModel(word: "Hello", translate: "Привет"),
                                           WordModel(word: "House", translate: "Дом"),
                                           WordModel(word: "Winter", translate: "Зима"),
                                           WordModel(word: "Book", translate: "Книга"),
                                           WordModel(word: "Island", translate: "Остров"),
                                           WordModel(word: "Car", translate: "Машина"),
    ]
    
    override func loadView() {
        super.loadView()
        setupConstraint()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupTableView()
    }
    
    
    func addNewWord() {
        let alert = UIAlertController(title: "Новое слово", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "add", style: .default) { _ in
            print("нажали add")
            
            guard let textfields = alert.textFields else { return }
            
            var main: String = ""
            var translate: String = ""
            
            for textfield in textfields {
                if textfield.tag == 1 {
                    main = textfield.text ?? ""
                }
                
                if textfield.tag == 2 {
                    translate = textfield.text ?? ""
                }
            }
            
            let model = WordModel(word: main, translate: translate)
            
            self.arrayWords.append(model)
            
            self.tableView.reloadData()
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("нажали cancel")
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        alert.addTextField { textField in
            textField.placeholder = "Main слово"
            textField.tag = 1
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Translate слово"
            textField.tag = 2
        }
        
        present(alert, animated: true)
    }
    
}

private extension MainViewController{
    
    func setupTableView(){
        tableView.backgroundColor = .systemOrange
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func setupNavigationView(){
        navigationItem.title = "Все слова"
        navigationController?.navigationBar.largeContentTitle = "Все слова"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
        navigationController?.navigationBar.tintColor = .systemOrange
        
    }
    func setupConstraint() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
                
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), //TODO ????
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    @objc private func addButtonAction(_sender:UIBarButtonItem){
        //present (модельное окно)
//        let vc = AddWordViewController()
//        present(vc, animated: true)
        
        //push (переход)
//        let vc = AddWordViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        addNewWord()
    }
    
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //word
        let string = arrayWords[indexPath.row].word
        cell.textLabel?.text = string
        
        //translate
        let translate = arrayWords[indexPath.row].translate
        cell.detailTextLabel?.text = translate
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.backgroundColor = .systemYellow
        
//        let vc = AddWordViewController()
//        navigationController?.pushViewController(vc, animated: true)
        addNewWord()
    }
    
}





class MainTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









//MARK: - SwiftUI
import SwiftUI
struct Provider_MainViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return UINavigationController(rootViewController: viewController)
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = MainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> UINavigationController {
            return UINavigationController(rootViewController: viewController)
        }
        
        func updateUIViewController(_ uiViewController: Provider_MainViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_MainViewController.ContainterView>) {
            
        }
    }
    
}








    

