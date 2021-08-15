//
//  InputStack.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//

import UIKit

class InputStack : UIView, UITextFieldDelegate {
    
    let stackView : UIStackView = {
       let temp = UIStackView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.spacing = 0
        temp.distribution = .fill
        return temp
    }()
    
    let input1 : InputView = {
        let temp = InputView()
        temp.setLabelText(text: "Duration of short break (in minutes)")
        temp.setPlaceholder(text: "Enter duration of short break")
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let input2 : InputView = {
        let temp = InputView()
        temp.setLabelText(text: "Duration of large break (in minutes)")
        temp.setPlaceholder(text: "Enter duration of large break")
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let input3 : InputView = {
        let temp = InputView()
        temp.setLabelText(text: "After which grade is large break")
        temp.setPlaceholder(text: "Enter number")
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let input4 : InputView = {
        let temp = InputView()
        temp.setLabelText(text: "Desired time")
        temp.setPlaceholder(text: "Enter the desired time")
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    func getText1() -> String {
        return input1.getText()
    }

    func getText2() -> String {
        return input2.getText()
    }

    func getText3() -> String {
        return input3.getText()
    }
    
    func getText4() -> String {
        return input4.getText()
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
    
    func isAtLeastOneEmpty() -> Bool {
        return getText1().isEmpty == true || getText2().isEmpty == true || getText3().isEmpty == true || getText4().isEmpty == true
    }

    func setupViews() {
        stackView.addArrangedSubview(input1)
        stackView.addArrangedSubview(input2)
        stackView.addArrangedSubview(input3)
        stackView.addArrangedSubview(input4)
        self.addSubview(stackView)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard case let textFieldText = getText4(),
//                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
//                    return false
//            }
//        let substringToReplace = textFieldText[rangeOfTextToReplace]
//        let count = textFieldText.count - substringToReplace.count + string.count
//        return (string == "" || Int(string) != nil || string == ":") && count < 5
//        }
}
