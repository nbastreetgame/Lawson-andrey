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
    
    var arrayWords: [WordModel] = [WordModel(word: "Hello", translate: "Привет"),
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
        testClousure(text: "dsdsds") {
            print("🌼🌼🌼🌼🌼🌼🌼")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
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
        let vc = AddWordViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func testClousure(text: String, function: () -> Void) {
        
        print(text)
        
        function()
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        let value = arrayWords[indexPath.row]
        
        let vc = AddWordViewController()
        
        vc.delegate = self
        
        vc.editWord = value
        
        vc.indexPath = indexPath
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //свайп с задней стороны
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let contextualAction = UIContextualAction.init(style: .destructive, title: "Удалить") { _, _, _ in
            
            // 1 - удалить элемент из массива
            self.arrayWords.remove(at: indexPath.row)
            
            //2 - indexPath удалить
            
            tableView.reloadData()
        }
        
        let swipeActionsConfiguration = UISwipeActionsConfiguration.init(actions: [contextualAction])
        
        return swipeActionsConfiguration
    }
}

//MARK: - Documet Protocol
extension MainViewController: DocumetProtocol {
    func editing(model: WordModel, indexPath: IndexPath) {
        arrayWords[indexPath.row] = model
        
        tableView.reloadData()
    }
    
   
    func saveText(model: WordModel) {
        arrayWords.append(model)
        tableView.reloadData()
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









    

