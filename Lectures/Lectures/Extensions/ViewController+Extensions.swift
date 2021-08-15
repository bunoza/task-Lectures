//
//  ViewController+Extensions.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//
import UIKit

extension ViewController {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
