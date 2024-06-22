//
//  MainViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 01.03.2024.
//

import UIKit
import RealmSwift


class WordModel: Object {
    @Persisted(primaryKey: true) var _id: UUID
    @Persisted var word: String
    @Persisted var translate: String
    
   convenience init(word: String, translate: String) {
        self.init()
        self._id = UUID()
        self.word = word
        self.translate = translate
    }
}


class MainViewController: BaseViewController {
    
  
    private let tableView = UITableView(frame:.zero, style: .plain)
    private var arrayWords: Results<WordModel>!
    override func loadView() {
        super.loadView()
        setupConstraint()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationView()
        setupTableView()
        testClousure(text: "csdhfv"){
            
        }
        
        //создать и педактирование
        let realm = try! Realm()
        let result = realm.objects(WordModel.self)
        
        arrayWords = result
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func testClousure(text:String,function: () -> Void) {
        print(text)
        
        function()
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
    
    
}
//MARK: - UITableViewDataSource, UITableViewDelegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        //word
        let string = arrayWords[indexPath.row].word
       
        
        //translate
        let translate = arrayWords[indexPath.row].translate
      
        
        cell.setup(title: string, detail: translate)
        
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
        
        let contextualAction = UIContextualAction.init(style: .destructive, title: "Удалить") { _,_,_ in
           // 1 - удалить элемент из массива
//            self.arrayWords.remove(at: indexPath.row)
            
           //2 - indexPatch удалить
            
            tableView.reloadData()
            
        }
        let SwipeActionsConfiguration = UISwipeActionsConfiguration.init(actions: [contextualAction])
        
        return SwipeActionsConfiguration
    }
    
    
}
//MARK: - Document Protocol

extension MainViewController: DocumetProtocol {
    func editing(model: WordModel, indexPath: IndexPath) {
//        arrayWords[indexPath.row] = model
//        
//        let realm = try! Realm()
//        try! realm.write {
//            realm.add(model, update: .modified)
//        }
        
        tableView.reloadData()
    }
    
   
    func saveText(model: WordModel) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(model)
        }
//        arrayWords.append(model)
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









    

