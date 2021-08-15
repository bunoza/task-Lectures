//
//  OverlayView.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//
import UIKit

class OverlayView: UIViewController {
    
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    let text : String
    
    let label : UILabel = {
        let temp = UILabel()
        temp.numberOfLines = 0
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let button : UIButton = {
        let temp = UIButton()
        temp.setImage(UIImage.resizeImage(image: UIImage(named: "x-icon")!, targetSize: CGSize(width: 30.0, height: 30.0)), for: .normal)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    init(text : String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    func setLabelText() -> Void {
        let temp = NSAttributedString(string: self.text, attributes: [.foregroundColor : UIColor.systemBlue])
        label.attributedText = temp
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizerAction(sender:)))
        button.addGestureRecognizer(tapGesture)
        view.backgroundColor = .white
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() -> Void {
        view.addSubview(label)
        view.addSubview(button)
        setLabelText()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard translation.y >= 0 else { return }
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                endOverlay()
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
        }
    
    @objc func tapGestureRecognizerAction(sender: UITapGestureRecognizer) {
                endOverlay()
            }
        
    func endOverlay() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
}
