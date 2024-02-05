//
//  Loginswift
//  First project
//
//  Created by Akbarkhon Akramov on 24/12/23.
//

import UIKit

final class LoginVIew: UIView {
    
    let secondGrayView = PaddedTextField()
    
    private let create = UILabel()
    
    let apple = UIButton(type: .system)
    let enterLogIn = UIButton(type: .system)
    let forgotPassword = UIButton(type: .system)
    let policy = UIButton(type: .system)
    let showPasswordLabel = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        Label(text: "Электронная почта или телефон", 
              frameX: 15, frameY: 224, Width: 200, Height: 14,
              font: 12, ColorR: 0, ColorG: 47, ColorB: 52)
        Label(text: "Пароль",
              frameX: 15, frameY: 304, Width: 50, Height: 14,
              font: 12, ColorR: 0, ColorG: 47, ColorB: 52)
        Label(text: "При входе вы соглашаетесь с нашими", 
              frameX: 100, frameY: 606, Width: 230, Height: 15,
              font: 12, ColorR: 0, ColorG: 0, ColorB: 0)
        Label(text: "ИЛИ",
              frameX: 200, frameY: 489, Width: 35, Height: 20,
              font: 16, ColorR: 0, ColorG: 47, ColorB: 52)
        
        grayView(X: 15, Width: 260)
        grayView(X: 250, Width: 265)
        
        TextField()
        passwordTextField()
        showPassword()
        forgotPasswordFunc()
        login()
        continueApple()
        serviceButton()
        
            }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Label(text: String, frameX: Int, frameY: Int, Width: Int, Height: Int, 
               font: Int, ColorR: Int, ColorG: Int, ColorB: Int) {
        
        let Label = UILabel()
        
        addSubview(Label)
        
        Label.frame = CGRect(x: frameX, y: frameY, width: Width, height: Height)
        Label.text = text
        Label.textColor = .rgb(CGFloat(ColorR), CGFloat(ColorG), CGFloat(ColorB))
        Label.font = .systemFont(ofSize: CGFloat(font))

        
    }       //Label
   
    func TextField() {
        
        let grayView = PaddedTextField()
        
        addSubview(grayView)
        
        grayView.frame = CGRect(x: 15, y: 246, width: Int(UIScreen.main.bounds.width) - 30, height: 45)
        grayView.backgroundColor = UIColor.systemGray5
        grayView.placeholder = "Enter your e-mail"
        grayView.layer.cornerRadius = 5
    }       //TX field
    
    func grayView(X: Int, Width: Int) {
        
        let or = UIView()
        
        addSubview(or)
        
        or.frame = CGRect(x: X, y: 499, width: Int(UIScreen.main.bounds.width) - Width, height: 1)
        or.backgroundColor = .systemGray4
        
    }  //View

    func passwordTextField() {
        
        addSubview(secondGrayView)
        
        secondGrayView.frame = CGRect(x: 15, y: 326, width: UIScreen.main.bounds.width - 30, height: 45)
        secondGrayView.backgroundColor = UIColor.systemGray5
        secondGrayView.placeholder = "Enter your password"
        secondGrayView.layer.cornerRadius = 5
    }   //TX field
    func showPassword() {
        
        addSubview(showPasswordLabel)
        
        showPasswordLabel.frame = CGRect(x: 345, y: 338, width: 65, height: 20)
        showPasswordLabel.setTitle("Показать", for: .normal)
        showPasswordLabel.setTitleColor(.rgb(0, 47, 52), for: .normal)
        showPasswordLabel.titleLabel?.font = .boldSystemFont(ofSize: 13)
       
        
    }        //Button
    func forgotPasswordFunc() {
        
        addSubview(forgotPassword)
        
        forgotPassword.frame = CGRect(x: 14, y: 394, width: 110, height: 14)
        forgotPassword.setTitle("Забыли пароль", for: .normal)
        forgotPassword.setTitleColor(.rgb(0, 47, 52), for: .normal)
        forgotPassword.backgroundColor = .white
        forgotPassword.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }  //Button
    func login() {
        
        addSubview(enterLogIn)
        
        enterLogIn.frame = CGRect(x: 15, y: 416, width: UIScreen.main.bounds.width - 30, height: 45)
        enterLogIn.backgroundColor = .rgb(0, 47, 52)
        enterLogIn.setTitle("Войти", for: .normal)
        enterLogIn.layer.cornerRadius = 5
        enterLogIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        enterLogIn.setTitleColor(.white, for: .normal)
        
    }               //Button
    func continueApple() {
        
        addSubview(apple)
        
        
        apple.frame = CGRect(x: 15, y: 536, width: UIScreen.main.bounds.width - 30, height: 45)
        apple.backgroundColor = UIColor.white
        apple.layer.borderWidth = 2
        apple.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        apple.setTitle("Продолжить с Apple ", for: .normal)
        apple.setTitleColor(.rgb(0, 47, 52), for: .normal)
        apple.layer.cornerRadius = 5
        apple.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
    }       //Button
    func serviceButton() {
        
        addSubview(policy)
        
        policy.frame = CGRect(x: 130, y: 622, width: 170, height: 15)
        policy.setTitle("Условиями использования", for: .normal)
        policy.setTitleColor(.black, for: .normal)
        policy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }       //Button
}
