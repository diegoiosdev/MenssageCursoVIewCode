//
//  RegisterViewController.swift
//  MyMoney
//
//  Created by Diego Fernando on 27/06/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
//        var auth:Auth?
        var alert :Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
//        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}


// MARK: - Settings Extension


extension RegisterViewController:UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextField()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension RegisterViewController:RegisterScreenProtocol{
    
    func actionBackButton() {

        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
   
        
//        guard let register = self.registerScreen else  {return}
//
//        let _:String = register.getEmail()
//        let _:String = register.getPassword()
//
//        self.auth?.createUser(withEmail: register.getEmail() ,password:register.getPassword(), completion: {(result , Error ) in
//
//            if error != nil {
//        self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao realizar cadastro")
//
//
//            }else {
//        self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuario cadastrado com sucesso", completion: {
//
//            self.navigationController?.popViewController(animated: true)
//
//        })
//
//            }
//        })
//   }
//}
    }
}
