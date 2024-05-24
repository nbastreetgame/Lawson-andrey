//
//  MainViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 01.03.2024.
//

import UIKit

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
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        //1
//        setupNetwork(text: "bdfasjdbasjdb", completion: clousure)
        
        
        setupNetwork(text: "test", completion:  { number in
            self.view.backgroundColor = .systemPink
        })
        
        
        setupNetwork(text: "test") { number in
            self.view.backgroundColor = .systemPink
        }
        
        setupNetwork(text: "dcsadjasb") { dksadshadkh in
            <#code#>
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.clousure()
//        }
        
    }
    
    
    
    func setupNetwork(text: String, completion: (Int) -> Void) {
        //2
        completion(2)
        //
        //
        //
        //
        //
       
    }
    
    func clousure(number: Int) -> Void  {
        self.view.backgroundColor = .systemPink
        
        return ()
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
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .systemYellow
    }
}

extension MainViewController: DocumetProtocol {
    var tie: String {
        get {
            ""
        }
        set {
            
        }
    }
    
    func goToCycyle() {
        
    }
    
    
    func saveText(model: WordModel) {
        arrayWords.append(model)
        tableView.reloadData()
    }
    
}
