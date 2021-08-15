//
//  Calculator.swift
//  Lectures
//
//  Created by Domagoj Bunoza on 12.08.2021..
//

class Calculator {
    
    let durationShort : Int
    let durationLarge : Int
    let grade : Int
    let desiredTime : Int
    let classDuration = 45
    let morningShift = 480
    let afternoonShift = 840
    
    init(durationShort : Int, durationLarge : Int, grade : Int, desiredTime : String) {
        self.durationShort = durationShort
        self.durationLarge = durationLarge
        self.grade = grade
        let arr = desiredTime.components(separatedBy: ":")
        self.desiredTime = Int(arr[0])! * 60 + Int(arr[1])!
    }
    
    func calculate() -> String {
        var sum : Int = 0
        var count : Int = 0
        if desiredTime < morningShift || desiredTime > 1190{
            return("School is out!")
        }else{
            if desiredTime >= morningShift && desiredTime < afternoonShift{
                sum += morningShift
            } else {
                sum += afternoonShift
            }
            while sum < desiredTime {
                count += 1
                if count == grade {
                    sum += classDuration + durationLarge
                } else {
                    sum += classDuration + durationShort
                }
            }
            if count == grade {
                if desiredTime > sum - durationLarge{
                        return "\(count). break is in progress"
                } else {
                        return "\(count). class is in progress"
                }
                    
            }else{
                if desiredTime > sum - durationShort{
                        return "\(count). break is in progress"
                } else {
                        return "\(count). class is in progress"
                }
            }
        }
    }
    
}
