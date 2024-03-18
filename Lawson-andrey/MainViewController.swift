//
//  MainViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 01.03.2024.
//

import UIKit


class MainViewController:UIViewController {
    
    override func loadView() {
        super.loadView()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    
    deinit {
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        
        //label3
        let label3 = UILabel()
        label3.text = "Все слова"
        label3.backgroundColor = .clear
        label3.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            label3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            label3.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 103),
            label3.topAnchor.constraint(equalTo: view.topAnchor,constant: 84),
            
            
            
        ])
        
        
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
            return MainViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = MainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_MainViewController.ContainterView>) -> MainViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_MainViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_MainViewController.ContainterView>) {
            
        }
    }
    
}
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
