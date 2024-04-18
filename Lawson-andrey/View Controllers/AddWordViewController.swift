//
//  AddWordViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 05.04.2024.
//

import UIKit

class AddWordViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(tableView)
        

        
//        navigationController?.title = "Новое слово"
//        title = "Новое слово"
        navigationItem.title = "Новое слово"
//        tabBarController?.title = "Новое слово"
        
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 15
        
        view.addSubview(whiteView)
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        //word
        let wordLabel = UILabel()
        wordLabel.text = "Слово"
        wordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        let detealWordLabel = UILabel()
        detealWordLabel.text = "на вашем языке"
        detealWordLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        detealWordLabel.textColor = .systemGray2
        
        let wordTextField = UITextField()
        wordTextField.placeholder = "Текст"
        wordTextField.contentVerticalAlignment = .bottom
        
        let wordLine = UIView()
        
        //translate
        let translateLabel = UILabel()
        translateLabel.text = "Перевод"
        translateLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        let detealTranslateLabel = UILabel()
        detealTranslateLabel.text = "на языке заучивания"
        detealTranslateLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        detealTranslateLabel.textColor = .systemGray2
        
        let translateTextField = UITextField()
        translateTextField.placeholder = "Текст"
        translateTextField.contentVerticalAlignment = .bottom
        
        let translateLine = UIView()
        
        
        for element in [wordLabel, detealWordLabel, translateLabel, detealTranslateLabel, wordTextField, wordLine, translateTextField, translateLine] {
            whiteView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            whiteView.heightAnchor.constraint(equalToConstant: 200),
            
            wordLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 18),
            wordLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            wordLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            detealWordLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 1),
            detealWordLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            detealWordLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            wordTextField.topAnchor.constraint(equalTo: detealWordLabel.bottomAnchor, constant: 5),
            wordTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            wordTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            wordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            wordLine.topAnchor.constraint(equalTo: wordTextField.bottomAnchor),
            wordLine.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            wordLine.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            wordLine.heightAnchor.constraint(equalToConstant: 1),
            
            //
            translateLabel.topAnchor.constraint(equalTo: wordLine.bottomAnchor, constant: 27),
            translateLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            translateLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            detealTranslateLabel.topAnchor.constraint(equalTo: translateLabel.bottomAnchor, constant: 1),
            detealTranslateLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            detealTranslateLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            translateTextField.topAnchor.constraint(equalTo: detealTranslateLabel.bottomAnchor, constant: 5),
            translateTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            translateTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            translateTextField.heightAnchor.constraint(equalToConstant: 44),
            
            translateLine.topAnchor.constraint(equalTo: translateTextField.bottomAnchor),
            translateLine.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            translateLine.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            translateLine.heightAnchor.constraint(equalToConstant: 1),
            translateLine.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -20)
        ])
        
        wordLine.backgroundColor = .systemGray4
        translateLine.backgroundColor = .systemGray4
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    
 //MARK: - Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        
        return cell
    }
    
}


//MARK: - SwiftUI
import SwiftUI
struct Provider_AddWordViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = UINavigationController(rootViewController: AddWordViewController())
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_AddWordViewController.ContainterView>) -> UINavigationController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_AddWordViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_AddWordViewController.ContainterView>) {
            
        }
    }
    
}
