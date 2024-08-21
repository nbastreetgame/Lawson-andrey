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
    private  let upperWhiteView = UIView()
    
    // property var
    weak var delegate:DocumetProtocol?
    
    var editWord: WordModel?
    var indexPath: IndexPath?
    
    // override func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstrains()
        setupView()
        setupTapImage()
        
    }
    
    
    
    private func setupTextFieldView(title: String, deteal: String, _ textField: UITextField) -> UIView {
        let newView = UIView()
        
        let wordLabel = UILabel()
        wordLabel.text = title //"Слово"
        wordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        
        let detailWordLabel = UILabel()
        detailWordLabel.text = deteal //"На вашем языке"
        detailWordLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        detailWordLabel.textColor = .systemGray2
        
        let wordLine = UIView()
        
        [wordLabel, detailWordLabel, textField, wordLine].forEach { subview in
            newView.addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        wordLine.backgroundColor = .systemGray4
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: 13),
            wordLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            wordLabel.heightAnchor.constraint(equalToConstant: 19),
            
            detailWordLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 1),
            detailWordLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            detailWordLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            detailWordLabel.heightAnchor.constraint(equalToConstant: 12),

            textField.topAnchor.constraint(equalTo: detailWordLabel.bottomAnchor, constant: 5),
            textField.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 27),
            
            wordLine.topAnchor.constraint(equalTo: textField.bottomAnchor),
            wordLine.bottomAnchor.constraint(equalTo: newView.bottomAnchor),
            wordLine.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
            wordLine.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
            wordLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        
        return newView
    }
    
    
    
    
    //private func
    private func setupConstrains(){
        
        //upperWhiteView
        let imageView = UIImageView(image: UIImage(named: "photo.badge"))
        imageView.contentMode = .scaleAspectFit
        
        //chooseImageLabel
        let chooseImageLabel = UILabel()
        chooseImageLabel.text = "Выбирите \nизображение "
        chooseImageLabel.textColor = .gray
        chooseImageLabel.textAlignment = .center
        chooseImageLabel.numberOfLines = 0
        
        
        let whiteView = UIView()
        
        //word
        let wordView = setupTextFieldView(title: "Слово", deteal: "На вашем языке", wordTextField)
        let translateView = setupTextFieldView(title: "Перевод", deteal: "На языке звучания", translateTextField)

        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        let orange = UIView()
        orange.backgroundColor = .orange
        orange.heightAnchor.constraint(equalToConstant: 44).isActive = true

        
        
        let stackView = UIStackView()
        stackView.axis = .vertical //axis
        stackView.distribution = .fill //distribution
        stackView.alignment = .fill // alignment
        stackView.spacing = 27 //spacing
        stackView.addArrangedSubview(wordView) //addArrangedSubview
        stackView.addArrangedSubview(translateView)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(orange)
        
        
        let upStackView = UIStackView()
        upStackView.axis = .vertical //axis
        upStackView.distribution = .fill //distribution
        upStackView.alignment = .center // alignment
        upStackView.spacing = 1 //spacing
        upStackView.addArrangedSubview(imageView)
        upStackView.addArrangedSubview(chooseImageLabel)
        
        
        upperWhiteView.addSubview(upStackView)
        
        whiteView.addSubview(stackView)
        
        [upperWhiteView, whiteView].forEach({
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .white
            view.addSubview($0)
        })
        
        [stackView, upStackView].forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical //axis
        mainStackView.distribution = .fill //distribution
        mainStackView.alignment = .fill // alignment
        mainStackView.spacing = 17 //spacing
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(upperWhiteView)
        mainStackView.addArrangedSubview(whiteView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: upperWhiteView.heightAnchor, multiplier: 90 / 192),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 22),
            stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -22),

            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),

            upStackView.topAnchor.constraint(equalTo: upperWhiteView.topAnchor, constant: 22),
            upStackView.bottomAnchor.constraint(lessThanOrEqualTo: upperWhiteView.bottomAnchor, constant: -10),
            upStackView.leadingAnchor.constraint(equalTo: upperWhiteView.leadingAnchor, constant: 15),
            upStackView.centerXAnchor.constraint(equalTo: upperWhiteView.centerXAnchor),

        ])
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
    
    private func setupTapImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        upperWhiteView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc private func imageTapped(){
       
        let alertViewController = UIAlertController(title: "Выберите действие", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            print("Нажалась кнопка Камера")
        }
        let gallary = UIAlertAction(title: "Фотоальбом", style: .default) { _ in
            print("Нажалась кнопка Фотоальбом")
        }
        let internet = UIAlertAction(title: "Интернет", style: .default) { _ in
            print("Нажалась кнопка Интернет")
        }
        let delete = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Нажалась кнопка Удалить")
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        
        alertViewController.addAction(camera)
        alertViewController.addAction(gallary)
        alertViewController.addAction(internet)
        alertViewController.addAction(delete)
        
        alertViewController.addAction(cancel)
        
        present(alertViewController, animated: true)
    }
    
}


#Preview {
    AddWordViewController()
}
