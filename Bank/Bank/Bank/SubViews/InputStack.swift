//
//  InputStack.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

import UIKit

class InputStack : UIView {
    
    let stackview : UIStackView = {
        let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.spacing = 0
        temp.distribution = .fill
        return temp
    }()
    
    let accountNumber : InputView = {
        let temp = InputView()
        temp.setPlaceholder(text: "Account number")
        return temp
    }()
    
    let accountType : InputView = {
        let temp = InputView()
        temp.setPlaceholder(text: "Bank account type")
        return temp
    }()
    
    let clientType : InputView = {
        let temp = InputView()
        temp.setPlaceholder(text: "Client type")
        return temp
    }()
    
    func getAccountNumber() -> String {
        return accountNumber.getText()
    }
    
    func getAccountType() -> String {
        return accountType.getText()
    }
    
    func getClientType() -> String {
        return clientType.getText()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        stackview.addArrangedSubview(accountNumber)
        stackview.addArrangedSubview(accountType)
        stackview.addArrangedSubview(clientType)
        self.addSubview(stackview)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
}
