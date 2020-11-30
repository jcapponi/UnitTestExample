//
//  ViewController.swift
//  UnitTesting
//
//  Created by Juan Capponi on 11/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private let dumyBackEnd = [User(username:"mauro", password:"12345678")]
    
    private let validation: ValidationService
    
    
    init(validation: ValidationService) {
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    
    
    @IBAction func didTapLoginButton(_ sender: Any){
        do {
            let username = try validation.validateUserName(userName.text)
            let pass = try validation.validatePassword(password.text)
            
            //Simulate Login to backend
            if let user = dumyBackEnd.first(where: { user  in
                user.username == username && user.password == pass
            }) {
                alert(title: "" ,message: "You succesufully loged in as \(user.username)")
            } else {
                throw LoginError.invalidCredentials
            }
 
        } catch {
            alert(title: "",message: error.localizedDescription)
        }
    }
    
    
    func alert(title: String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

enum LoginError: LocalizedError {
    case invalidCredentials
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Incorrect credentials"
    }
  }
}


struct User {
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    var username:String
    var password:String
}
    