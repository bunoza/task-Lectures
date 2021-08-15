//
//  ViewController.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let stackView : InputStack = {
        let temp = InputStack()
        return temp
    }()
    
    let button : UIButton = {
        let temp = UIButton()
        temp.backgroundColor = .brown
        temp.setTitle("Find out", for: .normal)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: #selector(click(_sender:)), for: .touchUpInside)
        return temp
    }()
    

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
        self.navigationItem.title = "Lectures";
    }

    func setUpViews(){
        view.addSubview(stackView)
        view.addSubview(button)
    }
        
    @objc func click(_sender: UIButton!) -> Void {
        guard stackView.isAtLeastOneEmpty() else {
            let slideOverlay = OverlayView(text: findOut())
            slideOverlay.modalPresentationStyle = .custom
            slideOverlay.transitioningDelegate = self
            self.present(slideOverlay, animated: true, completion: nil)
            return
        }
    }
    
    
    func findOut() -> String {
        let calculator = Calculator(durationShort: Int(stackView.getText1())!, durationLarge: Int(stackView.getText2())!, grade: Int(stackView.getText3())!, desiredTime: stackView.getText4())
        return calculator.calculate()
    }
    
        func setUpConstraints(){
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                button.heightAnchor.constraint(equalToConstant: 70),
            ])
        }
    
}
