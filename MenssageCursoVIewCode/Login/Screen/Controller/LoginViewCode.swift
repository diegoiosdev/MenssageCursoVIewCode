//
//  LoginViewCode.swift
//  MyMoney
//
//  Created by Diego Fernando on 26/06/22.

import UIKit
import SnapKit
import Firebase

class LoginViewCode: UIViewController {
    
    var auth:Auth?
    var loginScreen = LoginScreen()
    var alert :Alert?
    
    
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.loginScreen.delegate(delegate: self)
        self.loginScreen.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Settings extension

extension LoginViewCode: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Settings Protocol

extension LoginViewCode: LoginScreenProtocol{
    
    func actionLoginButton() {
   
//
//
//        guard let login = self.loginScreen else {return}
//
//       self.auth?.createUser(withEmail: register.getEmail() ,password:register.getPassword(), completion: {(usuario , Error ) in
//
//                if error != nil {
//                      self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados Incorretos, verifique e tente novamente")
//                   }else {
//
//                     if usuario == nil {
//                           self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
//                  }else {
//                    self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuario logado com sucesso")
//                 }
//            }
//        })
//
        
//        self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    func actionRegisterButton() {
        let vc:RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}





