//
//  InputView.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

import UIKit

class InputView : UIView {
    
    let textField : UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .systemGray6
        temp.setBottomBorder()
        temp.textAlignment = .left
        return temp
    }()
    
    func setPlaceholder(text: String) -> Void {
        textField.placeholder = text
    }
    
    func getText() -> String {
        return textField.hasText ? textField.text! : "invalid"
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
        self.addSubview(textField)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            self.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

}
