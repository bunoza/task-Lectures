//
//  InputView.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//
import UIKit

class InputView : UIView, UITextFieldDelegate {
    
    let label : UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textAlignment = .left
        return temp
    }()
    
    let textField : UITextField = {
        let temp = UITextField()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .systemGray6
        temp.setLeftPaddingPoints(10)
        temp.textAlignment = .left
        return temp
    }()

    func setPlaceholder(text: String) -> Void {
        textField.placeholder = text
    }
    
    func setLabelText(text : String) -> Void {
        let temp = NSAttributedString(string: text, attributes: [.foregroundColor : UIColor.systemBlue, .font : UIFont(name: "Arial", size: 15)!])
        label.attributedText = temp
    }

    func getText() -> String {
        return textField.text!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        textField.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(textField)
        self.addSubview(label)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            textField.topAnchor.constraint(equalTo: label.topAnchor, constant: 40),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40),
            self.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
                let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                    return false
            }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return (string == "" || Int(string) != nil || string == ":") && count < 6
        }
}
