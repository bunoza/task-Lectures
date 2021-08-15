//
//  AccountTypeValidator.swift
//  Bank
//
//  Created by Domagoj Bunoza on 13.08.2021..
//

class AccountTypeValidator {
    
    let accountNumber : String
    let accountType : String
    let clientType : String
    
    init(accountNumber: String, accountType: String, clientType: String) {
        self.accountNumber = accountNumber
        self.accountType = accountType
        self.clientType = clientType
    }
    
    func validate() -> Cases {
        
        let digits = accountNumber.compactMap{ $0.wholeNumberValue }
        if digits[digits.count-1] % 3 == 0 &&
            digits[digits.count-2] % 3 == 0 &&
            digits[digits.count-3] % 3 == 0 {
            if clientType.lowercased() == "partnership firm" {
                return Cases.Donation
            }
            if clientType.lowercased() == "individual person" {
                return Cases.Incentive

            }
        }
        if clientType.lowercased() == "individual person" &&
            accountType.lowercased() == "savings account"{
            return Cases.IndividualPerson
        }
        return Cases.Luck
    }
    
}
