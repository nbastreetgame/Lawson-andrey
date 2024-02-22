//
//  ViewController.swift
//  Lawson-andrey
//
//  Created by Apple on 19.02.2024.
//

import UIKit


class ViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        button.setTitle("Кнопка", for: .normal)
        button.backgroundColor = .systemBlue
        view.addSubview(button)
        button.frame = CGRect(x: view.bounds.midX - 40, y: view.bounds.midY, width: 80, height: 40)
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    @objc func action(){
        let controller = UIViewController()
        present(controller, animated: true)
    }

}

