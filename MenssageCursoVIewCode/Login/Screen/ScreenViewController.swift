//
//  ScreenViewController.swift
//  MyMoney
//
//  Created by Diego Fernando on 27/06/22.
//
import UIKit

protocol LoginScreenProtocol: class {
    func actionLoginButton()
    func actionRegisterButton()
}


class LoginScreen: UIView {
    
  private  weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "Bem Vindo"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Time")
        image.tintColor = .darkGray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu Email"
        textField.textColor = .darkGray
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.placeholder = "Digite seu Senha"
        textField.textColor = .black
        
        return textField
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.lightGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        return button
    }()

    // MARK: - Adding elements to the view

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        self.configLoginLabelConstraint()
        self.configlogoAppImageViewConstraint()
        self.configemailTextFieldConstraint()
        self.configpasswordTextFieldConstraint()
        self.configloginButtonConstraint()
        self.configregisterButtonConstraint()
//        self.setUpContraints()
        self.configButtonEnble(false)
        
    }
    // MARK: - Settings
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 24/25, green: 117/255, blue: 104/255, alpha: 1.0)
        
    }
    
    private func configSuperView() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    // MARK: - Settings textField delegate
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    // MARK: - Settings Buttons
    
    @objc private func tappedLoginButton() {
//        print("Botão acionado.")
        self.delegate?.actionLoginButton()
    }
    @objc private func tappedRegisterButton() {
//        print("Botão acionadog.")
        self.delegate?.actionRegisterButton()
    }
    // MARK: - Settings validação TextField
    
    public func validaTextField(){
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            self.configButtonEnble(true)
        }else {
            self.configButtonEnble(true)
        }
    }
    
    private func configButtonEnble(_ enable:Bool){
        if enable{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else{
            self.loginButton.setTitleColor(.black, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    // MARK: - Settings get email+password
    
    public func getEmail()-> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword()-> String{
        return self.passwordTextField.text ?? ""
    }
    
    // MARK: - Settings init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings contraints

}
