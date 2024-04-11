//
//  AddWordViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 05.04.2024.
//

import UIKit

class AddWordViewController:BaseViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = .init(title: "Сохранить", style: .done, target: self, action: #selector(saveWord(_:)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        addNewWord()
    }
    
    
    func addNewWord() {
        let alert = UIAlertController(title: "Новое слово", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "add", style: .default) { _ in
            print("нажали add")
            self.navigationController?.popViewController(animated: true)
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("нажали cancel")
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    
    @objc private func saveWord(_ sender: UIBarButtonItem) {
        
    }
}
