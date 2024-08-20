

import Foundation
class StartViewController: UIViewController {
    private let label = UILabel()
    
    let button = UIButton()
    let imageView = UIImageView(image: UIImage(named: "logo" ))
    
    
    override func loadView() {
        super.loadView()
        
        //image
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        
        //label
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //label2
        let label2 = UILabel()
        label2.text = "Учи слова вместе с нами"
        label2.backgroundColor = .clear
        label2.font = UIFont.systemFont(ofSize: 10, weight: .black)
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //constraint
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 137),
            imageView.heightAnchor.constraint(equalToConstant: 137),
            
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 42),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            label2.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 18),
            label2.centerXAnchor.constraint(equalTo: label.centerXAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //label
        label.text = "L e a r n"
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 40, weight: .black)
        label.numberOfLines = 1
        label.textAlignment = .center
    }
 
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Loading ...
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = MainViewController.init()
            let navigation = UINavigationController(rootViewController: vc)
//            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true)
        }
    }
}
//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = StartViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> StartViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
    
}
