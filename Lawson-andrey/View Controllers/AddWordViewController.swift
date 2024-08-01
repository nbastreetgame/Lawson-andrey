//
//  AddWordViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 05.04.2024.
//

import UIKit


// class struct enum

protocol DocumetProtocol: AnyObject {
    
    func saveText(model:WordModel)
    func editingReloadData()
}


class AddWordViewController:BaseViewController {
    
// property let
 private  let wordTextField = UITextField()
private  let translateTextField = UITextField()
    
// property var
    weak var delegate:DocumetProtocol?
    
    var editWord: WordModel?
    var indexPath: IndexPath?
// override func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstrains()
        setupView()
      
}
    //private func
    private func setupConstrains(){
        
        
        
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 15
        
        view.addSubview(whiteView)
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        //word
        let wordLabel = UILabel()
        wordLabel.text = "Слово"
        wordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        
        let detailWordLabel = UILabel()
        detailWordLabel.text = "На вашем языке"
        detailWordLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        detailWordLabel.textColor = .systemGray2
        
        
        
        
        let wordLine = UIView()
        
        //translate
        let translateLabel = UILabel()
        translateLabel.text = "Перевод"
        translateLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        let detailTranslateLabel = UILabel()
        detailTranslateLabel.text = "На языке звучания"
        detailTranslateLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        detailTranslateLabel.textColor = .systemGray2
        
        
       
       
        
        let translateLine = UIView()
        
        
        for element in [wordLabel, detailWordLabel, translateLabel, detailTranslateLabel, wordTextField, wordLine, translateTextField, translateLine] {
            whiteView.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
           
            
            wordLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 18),
            wordLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            wordLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            detailWordLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 1),
            detailWordLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            detailWordLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            wordTextField.topAnchor.constraint(equalTo: detailWordLabel.bottomAnchor, constant: 5),
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
            
            detailTranslateLabel.topAnchor.constraint(equalTo: translateLabel.bottomAnchor, constant: 1),
            detailTranslateLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            detailTranslateLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            
            translateTextField.topAnchor.constraint(equalTo: detailTranslateLabel.bottomAnchor, constant: 5),
            translateTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 21),
            translateTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            translateTextField.heightAnchor.constraint(equalToConstant: 44),
            
            translateLine.topAnchor.constraint(equalTo: translateTextField.bottomAnchor),
            translateLine.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 18),
            translateLine.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -21),
            translateLine.heightAnchor.constraint(equalToConstant: 1),
            translateLine.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -20)
        ])
        
        wordLine.backgroundColor = .systemGray4
        translateLine.backgroundColor = .systemGray4
       
        
    }
    
    private func setupView(){
        navigationItem.title = "Новое слово"
        
        wordTextField.placeholder = "Текст"
        wordTextField.contentVerticalAlignment = .bottom
        
        translateTextField.placeholder = "Текст"
        translateTextField.contentVerticalAlignment = .bottom
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveAction(action:)))
        
        wordTextField.text = editWord?.word
        translateTextField.text = editWord?.translate
    }
    
   //override func
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
  // private func
    @objc private func saveAction(action sender: UIBarButtonItem){
       
        
        
        guard let word = wordTextField.text, 
                word != "",
              let translate = translateTextField.text,
              translate != "" else {
            let alert = UIAlertController(title: "Error", message: "Введите текст", preferredStyle: .alert)
            let ok = UIAlertAction(title: "cancel", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }
         
       
        
        
        if let editWord = editWord, let _ = indexPath {
        
            DataBase.shared.editing(editWord, word: word, translate: translate)
            
            //editing
            delegate?.editingReloadData()
            navigationController?.popViewController(animated: true)
        }else{
            //new word
            let model = WordModel(word: word, translate: translate)
            delegate?.saveText(model: model)
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    // other actions
}
  // extensions
