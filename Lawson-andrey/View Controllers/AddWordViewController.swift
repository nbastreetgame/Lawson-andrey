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
    private let upperWhiteView = UIView()
    private let selectImageView = UIImageView()
    private let  playLabel = UILabel()
    
    
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
    
    private  func setupTextFieldView(title: String, detail: String, _ textField: UITextField) -> UIView {
      
      let newView = UIView()
      
      let wordLabel = UILabel()
      wordLabel.text = title //"Слово"
      wordLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
      
   
      
      let detailWordLabel = UILabel()
      detailWordLabel.text = detail // "На вашем языке"
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
        let chooseImageLabel = UILabel()
        let  imageView = UIImageView(image: UIImage(named: "photo badge"))
        imageView.contentMode = .scaleAspectFit
        
        //chooseImageLabel
        chooseImageLabel.text = "Выбирите \nизображение"
        chooseImageLabel.textColor = .gray
        chooseImageLabel.textAlignment = .center
        chooseImageLabel.numberOfLines = 0
       
        
     let whiteView = UIView()
        
        
        //word
    let wordView = setupTextFieldView(title: "Слово", detail: "На вашем языке", wordTextField)
    let translateView = setupTextFieldView(title: "Перевод", detail: "На языке звучания", translateTextField)
        
        playLabel.text = "Воспроизвести"
        playLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        playLabel.translatesAutoresizingMaskIntoConstraints = false
       
        let playerStackView = UIStackView()
        playerStackView.axis = .vertical
        playerStackView.distribution = .fill
        playerStackView.alignment = .fill
        playerStackView.spacing = 27
        
playerStackView.translatesAutoresizingMaskIntoConstraints = false
        playerStackView.addArrangedSubview(playLabel)
        
        let languageStackView = UIStackView()
        languageStackView.axis = .vertical
        languageStackView.distribution = .fill
        languageStackView.alignment = .fill
        languageStackView.spacing = 27
        
languageStackView.translatesAutoresizingMaskIntoConstraints = false
 
        
        
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 27
        stackView.addArrangedSubview(wordView)
        stackView.addArrangedSubview(translateView)
        stackView.addArrangedSubview(playerStackView)
        stackView.addArrangedSubview(languageStackView)
       
        
   
        let upStackView = UIStackView()
        upStackView.axis = .vertical
        upStackView.distribution = .fillEqually
        upStackView.alignment = .center
        upStackView.spacing = 1
        upStackView.addArrangedSubview(imageView)
        upStackView.addArrangedSubview(chooseImageLabel)
        
        
        
        
        upperWhiteView.addSubview(upStackView)
        upperWhiteView.addSubview(selectImageView)
        upperWhiteView.clipsToBounds = true
        
  
        whiteView.addSubview(stackView)
      
      
       
        
        
        [upperWhiteView,whiteView].forEach({
            $0.layer.cornerRadius = 15
            $0.backgroundColor = .white
            view.addSubview($0)
        })
        
        
        //imageView
        imageView.isUserInteractionEnabled = true

       
        
[  stackView, upStackView].forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        

        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.spacing = 17
        
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        selectImageView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(upperWhiteView)
        mainStackView.addArrangedSubview(whiteView)
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalTo: upperWhiteView.heightAnchor, multiplier: 90 / 192),
            imageView.widthAnchor.constraint(equalTo: upperWhiteView.heightAnchor),
            
         
            stackView.topAnchor.constraint(equalTo: whiteView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -22),
            stackView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor,constant: 22),
            stackView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor,constant: -22),
            
            selectImageView.topAnchor.constraint(equalTo: upperWhiteView.topAnchor),
            selectImageView.bottomAnchor.constraint(equalTo: upperWhiteView.bottomAnchor),
            selectImageView.leadingAnchor.constraint(equalTo: upperWhiteView.leadingAnchor),
            selectImageView.trailingAnchor.constraint(equalTo: upperWhiteView.trailingAnchor),
            
            
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            upStackView.topAnchor.constraint(equalTo: upperWhiteView.topAnchor, constant: 22),
            upStackView.bottomAnchor.constraint(lessThanOrEqualTo: upperWhiteView.bottomAnchor,  constant: -10),
            upStackView.leadingAnchor.constraint(equalTo: upperWhiteView.leadingAnchor, constant: 15),
            upStackView.centerXAnchor.constraint(equalTo: upperWhiteView.centerXAnchor),
            upStackView.widthAnchor.constraint(equalToConstant: 345),
            upStackView.heightAnchor.constraint(equalToConstant: 192),
            
            playerStackView.widthAnchor.constraint(equalToConstant: 301),
            playerStackView.heightAnchor.constraint(equalToConstant: 50),
            
            languageStackView.widthAnchor.constraint(equalToConstant: 302),
            languageStackView.heightAnchor.constraint(equalToConstant: 44),
            
    playLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 21),
    playLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 99)
          
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
        } else {
            //new word
            let model = WordModel(word: word, translate: translate)
            delegate?.saveText(model: model)
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    private func setupTapImage(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        upperWhiteView.addGestureRecognizer(tapGesture)
       
    }
    @objc private func imageTapped(){
        
        let alertViewController = UIAlertController(title: "Выбирите действие", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Камера", style: .default) { _ in
            print("нажалась кнопка Камера")
        }
        
        let galery = UIAlertAction(title: "Фотоальбом", style: .default) { _ in
            print("нажалась кнопка Фотоальбом")
            self.showPhotoGalaryOrCamera(.photoLibrary)
        }
        
        let internet = UIAlertAction(title: "Интернет", style: .default) { _ in
            print("нажалась кнопка Интернет")
            
            let internetVC = InternetViewController()
            internetVC.delegate = self
            self.navigationController?.pushViewController(internetVC, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("нажалась кнопка Отмена")
        }
        
        alertViewController.addAction(camera)
        alertViewController.addAction(galery)
        alertViewController.addAction(internet)
        
        
        if selectImageView.image != nil {
            let delete = UIAlertAction(title: "Удалить", style: .destructive) { _ in
                print("нажалась кнопка Удалить")
                self.selectImageView.image = nil
            }
            alertViewController.addAction(delete)
        }
           
            alertViewController.addAction(cancel)
            
            present(alertViewController, animated: true)
            
        }
    
    
    
    private func showPhotoGalaryOrCamera( _ type: UIImagePickerController.SourceType) {
        let pickerViewController = UIImagePickerController()
        pickerViewController.delegate = self
        pickerViewController.sourceType = type
       pickerViewController.allowsEditing = true
        
        present(pickerViewController, animated: true)
    }
    

}

extension AddWordViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image  = info [.editedImage] as? UIImage else { return }
        
        selectImageView.image = image
        
        picker.dismiss(animated: true)
    }
}

extension AddWordViewController: InternetViewControllerDelegate {
    func selectImage(_ image: UIImage) {
        selectImageView.image = image
    }
    
    
}

#Preview() {
    AddWordViewController()
}

