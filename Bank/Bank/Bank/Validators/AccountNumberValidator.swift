//
//  AccountNumberValidator.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

class AccountNumberValidator {
    
    let accountNumber : String
    let accountType : String
    let clientType : String
    
    init(accountNumber: String, accountType: String, clientType: String) {
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.clientType = clientType
    }
    
    func validate() -> Cases {
        if accountNumber.count != 10 {
            return Cases.Invalid
        }
        let digits = accountNumber.compactMap{ $0.wholeNumberValue }
        if digits[0] != 0 || digits[1] != 4 {
            return Cases.Invalid
        }
        if Int(accountNumber)! % 6 == 0 {
            return Cases.Divisible
        }
        return AccountTypeValidator(accountNumber: accountNumber, accountType: accountType, clientType: clientType).validate()
    }
    
    
}
