//
//  CustomAlertView.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//
import UIKit

class CustomAlertViewProvider {
    
    let bankCase : Cases
    
    init(bankCase: Cases) {
        self.bankCase = bankCase
    }
    
    func getAlertView() -> UIAlertController {
        let temp = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let title : NSAttributedString
        let messagePartOne : NSAttributedString
        let messagePartTwo : NSAttributedString
        
        switch bankCase {
        case .Divisible:
            title = NSAttributedString(string: "Divisible number", attributes: [.font : UIFont.boldSystemFont(ofSize: 17)])
            messagePartOne = NSAttributedString(string: "The account number is divisible by 6.\n", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
            messagePartTwo = NSAttributedString(string: "Bravo", attributes: [.foregroundColor : UIColor.systemGreen])
            temp.addAction(UIAlertAction(title: "I'm a real iOS dev now", style: .destructive, handler: nil))
        case .IndividualPerson:
            title = NSAttributedString(string: "Individual person", attributes: [.foregroundColor : UIColor.systemTeal])
            messagePartOne = NSAttributedString(string: "You are a person with a savings account.\n", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
            messagePartTwo = NSAttributedString(string: "AWESOME", attributes: [.foregroundColor : UIColor.systemYellow])
            temp.addAction(UIAlertAction(title: "Lucky me", style: .destructive, handler: nil))
        case .Donation:
            title = NSAttributedString(string: "The bank is donating one million $", attributes: [.font : UIFont.boldSystemFont(ofSize: 17)])
            messagePartOne = NSAttributedString(string: "That sounds amazing, doesn't it?\n", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
            messagePartTwo = NSAttributedString(string: "We're kidding this is just an exercise.", attributes: [.font : UIFont(name: "Avenir Next Condensed Bold", size: 15)!])
            temp.addAction(UIAlertAction(title: "You fooled me", style: .destructive, handler: nil))
        case .Incentive:
            title = NSAttributedString(string: "Incentive of one million euros!", attributes: [.font : UIFont.boldSystemFont(ofSize: 17), .foregroundColor : UIColor.systemGreen])
            messagePartOne = NSAttributedString(string: "If that were really the case, you wouldn't be where you are now, right?", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
            messagePartTwo = NSAttributedString(string: "", attributes: [:])
            temp.addAction(UIAlertAction(title: "No, I want to be an iOS developer", style: .destructive, handler: nil))
        case .Luck:
            title = NSAttributedString(string: "Better luck next time", attributes: [.font : UIFont.boldSystemFont(ofSize: 17)])
            messagePartOne = NSAttributedString(string: "Of all things, you put entries like this ...\n", attributes: [.font : UIFont(name: "Avenir Next Condensed", size: 15)!])
            messagePartTwo = NSAttributedString(string: "Try something else.", attributes: [.font : UIFont.boldSystemFont(ofSize: 15)])
            temp.addAction(UIAlertAction(title: "Never a developer from me", style: .destructive, handler: nil))
        default:
            title = NSAttributedString(string: "error")
            messagePartOne = NSAttributedString(string: "error")
            messagePartTwo = NSAttributedString(string: "error")
            temp.addAction(UIAlertAction(title: "error", style: .destructive, handler: nil))
        }
        
        let combination = NSMutableAttributedString()
        combination.append(messagePartOne)
        combination.append(messagePartTwo)
        temp.setValue(title, forKey: "attributedTitle")
        temp.setValue(combination, forKey: "attributedMessage")
        return temp
    }
    
}
