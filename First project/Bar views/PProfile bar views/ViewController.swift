//
//  ViewController.swift
//  First project
//
//  Created by Akbarkhon Akramov on 20/12/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private var SecureText = true
    private var secureText2 = true
    private let segmentedControll = UISegmentedControl()
    
    let firstView = LoginVIew(frame: .zero)
    let secondView = SignUpView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(firstView)
        firstView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, 
                                            height: UIScreen.main.bounds.height - 100)
        navigationView()
        segmentedcontrol()
        
    }
    
    @objc func buttonTapped() {
        let SecondVC = SecondViewController()
        navigationController?.pushViewController(SecondVC, animated: true)
    }
    @objc func buttonTappedApple() {
        let AppleVC = AppleViewController()
        navigationController?.pushViewController(AppleVC, animated: true)
    }
    @objc func forgotButton() {
        let ForgotVC = forgotpasswordView()
        navigationController?.pushViewController(ForgotVC, animated: true)
    }
    @objc func policyView() {
        let PolicyVC = PolicyView()
        navigationController?.pushViewController(PolicyVC, animated: true)
        
    }
    @objc func gestureRecognizing() {
        view.endEditing(true)
    }
    @objc func showSecure() {
        SecureText.toggle()
        firstView.secondGrayView.isSecureTextEntry = SecureText
    }
    @objc func showSecure2() {
        secureText2.toggle()
        secondView.secondGrayView.isSecureTextEntry = secureText2
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // Hide or show the views based on the selected segment
        firstView.isHidden = (sender.selectedSegmentIndex == 1)
        secondView.isHidden = (sender.selectedSegmentIndex == 0)
    }
    
    func navigationView() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Создать"
    }      //View
    func segmentedcontrol() {
        
        view.addSubview(segmentedControll)
        
        segmentedControll.insertSegment(withTitle: "Войти", at: 0, animated: true)
        segmentedControll.insertSegment(withTitle: "Зарегистроваться", at: 1, animated: true)
        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.frame = CGRect(x: 15, y: 166, width: UIScreen.main.bounds.width - 30, height: 31)
        segmentedControll.selectedSegmentTintColor = .rgb(0, 47, 53)
        segmentedControll.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        segmentedControll.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControll.addTarget(self, action: #selector(segmentedControlValueChanged(_:)),
                                                                          for: .valueChanged)
        view.addSubview(secondView)
        
        secondView.backgroundColor = .white
        secondView.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: 800)
        secondView.isHidden = true
        secondView.secondGrayView.isSecureTextEntry = secureText2
        secondView.showPasswordLabel.addTarget(self, action: #selector(showSecure2), for: .touchUpInside)
        secondView.apple.addTarget(self, action: #selector(buttonTappedApple), for: .touchUpInside)
        secondView.enterLogIn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        firstView.secondGrayView.isSecureTextEntry = SecureText
        firstView.showPasswordLabel.addTarget(self, action: #selector(showSecure), for: .touchUpInside)
        firstView.forgotPassword.addTarget(self, action: #selector(forgotButton), for: .touchUpInside)
        firstView.enterLogIn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        firstView.apple.addTarget(self, action: #selector(buttonTappedApple), for: .touchUpInside)
        firstView.policy.addTarget(self, action: #selector(policyView), for: .touchUpInside)
        gestureRec()
    }    //Segmented Control
    func gestureRec() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gestureRecognizing)))
    }          //gesture recognizer
}

class PaddedTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 75)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

extension UIColor {
    
    static func rgb(_ r: CGFloat,_ g: CGFloat, _ b: CGFloat) -> UIColor {
        UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}


