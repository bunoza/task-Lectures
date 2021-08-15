//
//  ViewController.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

import UIKit

class ViewController: UIViewController {
    
    let stackView : InputStack = {
        let temp = InputStack()
        return temp
    }()
    
    let label : UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 0
        return temp
    }()
    
    let button : UIButton = {
        let temp = UIButton()
        temp.backgroundColor = .systemRed
        temp.setTitle("Test your luck", for: .normal)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: #selector(click(_sender:)), for: .touchUpInside)
        return temp
    }()
    
    func showLabel() -> Void {
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributedTitle = NSAttributedString(string: "Some of the entries are incorrect. Check entries.", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!, .foregroundColor : UIColor.red])
        label.attributedText = attributedTitle
    }
    
    func hideLabel() -> Void {
        label.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTitle()
        setUpViews()
        setUpConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        button.roundedButton()
    }
    
    func setUpTitle() -> Void {
        view.backgroundColor = .white
        self.navigationItem.title = "Bank";
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemRed]
    }

    func setUpViews(){
        view.addSubview(stackView)
        view.addSubview(button)
        view.addSubview(label)
    }
        
    @objc func click(_sender: UIButton!) -> Void {
        hideLabel()
        let validator = AccountNumberValidator(accountNumber: stackView.getAccountNumber(), accountType: stackView.getAccountType(), clientType: stackView.getClientType())
        if validator.validate() == .Invalid {
            showLabel()
        } else {
            let alert = CustomAlertViewProvider(bankCase: validator.validate()).getAlertView()
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 70),
            label.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

