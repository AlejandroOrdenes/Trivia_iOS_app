//
//  InitialViewController.swift
//  Trivia
//
//  Created by Alejandro O. on 26-09-21.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var LogoImageView: UIImageView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = ""

        LogoImageView.layer.cornerRadius = LogoImageView.bounds.height / 2
        LogoImageView.clipsToBounds = true
    
    }
    @IBAction func pressButton(_ sender: Any) {
        if let username = textField.text, !username.isEmpty {
            presentBarController()
        } else {
            presentNousernameAlert()
        }
    }
    
    
    private func presentNousernameAlert() {
        let alert = UIAlertController(title: "Alerta", message: "Ingrese un nombre de Usuario!!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func presentBarController() {
        let tabBarViewController = TabBarViewController()
        tabBarViewController.modalPresentationStyle = .overFullScreen
        self.present(tabBarViewController, animated: true)
    }
    
}

