//
//  SignUpView.swift
//  First project
//
//  Created by Akbarkhon Akramov on 24/12/23.
//

import UIKit

final class SignUpView: UIView {
    
    let grayView = PaddedTextField()
    let secondGrayView = PaddedTextField()
    
    private var isConfirmed = false
    
    let apple = UIButton(type: .system)
    let enterLogIn = UIButton(type: .system)
    let forgotPassword = UIButton(type: .system)
    let showPasswordLabel = UIButton(type: .system)
    
    let termsCheckboxButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        Label(X: 15, Y: 170, W: 210, H: 14, text: "Электронная почта или телефон",
              TxtColorR: 0, TxtColorG: 47, TxtColorB: 52, fontSize: 12, Line: 1)
        Label(X: 15, Y: 250, W: 100, H: 14, text: "Пароль", TxtColorR: 0,
              TxtColorG: 47, TxtColorB: 52, fontSize: 12, Line: 1)
        Label(X: 15, Y: 330, W: Int(UIScreen.main.bounds.width) - 30, H: 45,
              text: "Пароль дольжен содержать минимум 6 символов. Чтобы пароль получился супернадежными,добавьте заглавные и строчные буквы, цыфры и специальные символы",
              TxtColorR: 0, TxtColorG: 0, TxtColorB: 0, fontSize: 12, Line: 3)
        
        Label(X: 70, Y: 395, W: Int(UIScreen.main.bounds.width) - 85, H: 60, 
              text: "Я соглащаюсь с правилами использования сервиса, а также с передачей и обработкой моих данных в OLX. Я подверждаю свое совершеннолетие и отвественность за размещение объявления ",
              TxtColorR: 0, TxtColorG: 0, TxtColorB: 0, fontSize: 12, Line: 4)
       
        Label(X: 200, Y: 120, W: 35, H: 20, text: "ИЛИ",
              TxtColorR: 0, TxtColorG: 47, TxtColorB: 52, fontSize: 16, Line: 1)
        
        grayLine(X: 15, W: 260)
        grayLine(X: 250, W: 265)
        
        mailTextField()
        passwordTextField()
        continueApple()
        showPassword()
        login()
        checkboxButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Label(X: Int, Y: Int, W: Int, H: Int, text: String, TxtColorR: 
        Int, TxtColorG: Int, TxtColorB: Int, fontSize: Int, Line: Int) {
        
        let Label = UILabel()
        
        addSubview(Label)
        
        Label.frame = CGRect(x: X, y: Y, width: W, height: H)
        Label.text = text
        Label.textColor = .rgb(CGFloat(TxtColorR), CGFloat(TxtColorB), CGFloat(TxtColorG))
        Label.font = .systemFont(ofSize: CGFloat(fontSize))
        Label.numberOfLines = Line
    }

    func grayLine(X: Int, W: Int) {
        
        let grayLine = UIView()
        
        addSubview(grayLine)
        
        grayLine.frame = CGRect(x: X, y: 130, width: Int(UIScreen.main.bounds.width) - W, height: 1)
        grayLine.backgroundColor = .systemGray3
        
    }             //View
    
    func mailTextField() {
        
        addSubview(grayView)
        
        grayView.frame = CGRect(x: 15, y: 192, width: UIScreen.main.bounds.width - 30, height: 45)
        grayView.backgroundColor = UIColor.systemGray5
        grayView.placeholder = "Enter you email"
        grayView.layer.cornerRadius = 5
    }       //TX field
    func passwordTextField() {
        
        addSubview(secondGrayView)
        
        secondGrayView.frame = CGRect(x: 15, y: 272, width: UIScreen.main.bounds.width - 30, height: 45)
        secondGrayView.backgroundColor = UIColor.systemGray5
        secondGrayView.placeholder = "Enter your password"
        secondGrayView.layer.cornerRadius = 5
    }   //TX field
    func showPassword() {
        
        addSubview(showPasswordLabel)
        
        showPasswordLabel.frame = CGRect(x: 328, y: 280, width: 100, height: 30)
        showPasswordLabel.setTitle("Показать", for: .normal)
        showPasswordLabel.setTitleColor(.rgb(0, 47, 52), for: .normal)
        showPasswordLabel.titleLabel?.font = .boldSystemFont(ofSize: 13)
        
        
    }        //Button
    func login(){
        
        addSubview(enterLogIn)
        
        enterLogIn.frame = CGRect(x: 15, y: 480, width: UIScreen.main.bounds.width - 30, height: 45)
        enterLogIn.backgroundColor = .rgb(0, 47, 52)
        enterLogIn.setTitle("Зарегистроваться", for: .normal)
        enterLogIn.layer.cornerRadius = 5
        enterLogIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        enterLogIn.setTitleColor(.white, for: .normal)
        
    }                //Button
    func continueApple() {
        
        addSubview(apple)
        
        apple.frame = CGRect(x: 15, y: 43, width: UIScreen.main.bounds.width - 30, height: 45)
        apple.backgroundColor = UIColor.white
        apple.layer.borderWidth = 2
        apple.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        apple.setTitle("Продолжить с Apple ", for: .normal)
        apple.setTitleColor(.rgb(0, 47, 52), for: .normal)
        apple.layer.cornerRadius = 5
        apple.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
    }       //Button
    func checkboxButton() {
        
        addSubview(termsCheckboxButton)
        
        termsCheckboxButton.frame = CGRect(x: 20, y: 410, width: 30, height: 30)
        termsCheckboxButton.backgroundColor =  UIColor.white
        termsCheckboxButton.layer.borderWidth = 1
        termsCheckboxButton.layer.cornerRadius = 5
        termsCheckboxButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
//        termsCheckboxButton.setImage(UIImage(contentsOfFile: "checkmark"), for: .normal)
        termsCheckboxButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }      //Checkbox
    
    @objc func checkButtonTapped(_ sender: UIButton){
        
        if isConfirmed {
            sender.setImage(nil, for: .normal)
        }else {
            sender.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }
        
        isConfirmed.toggle()
    }
}
