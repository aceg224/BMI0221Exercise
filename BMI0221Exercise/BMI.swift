//
//  BMI.swift
//  BMI0221Exercise
//
//  Created by min-chia on 2019/2/21.
//  Copyright © 2019 min-chia. All rights reserved.
//

import Foundation
class BMI: NSObject,NSSecureCoding {
    static var supportsSecureCoding: Bool{
        return true
    }
    var height = ""
    var weight = ""
    
    init(height:String, weight:String) {
        self.height = height
        self.weight = weight
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(height, forKey: "height")
        aCoder.encode(weight, forKey: "weight")
    }
    
    required init?(coder aDecoder: NSCoder) {
        height = aDecoder.decodeObject(of: NSString.self, forKey: "height") as String? ?? ""
        weight = aDecoder.decodeObject(of: NSString.self, forKey: "weight") as String? ?? ""
    }
//    func bMICount(height:Double, weight:Double) -> Double {
//        let bMIValue = weight/height/height*10000
//        return bMIValue
//    }
    var bMICount : Double{
        let heightcentimeters = Measurement(value: Double(height)!, unit: UnitLength.centimeters)
        let heightInMeter = heightcentimeters.converted(to: UnitLength.meters)
        return Double(weight)!/pow(heightInMeter.value, 2)
    }
    override var description: String{
        return bMIDescription(bMIValue: bMICount)
    }
    
    func bMIDescription(bMIValue:Double)->String{
        if bMIValue<18.5 {
            return "Underweight: BMI < 18.5"
        }else if bMIValue<25{
            return "Normal weight: 18.5 <= BMI < 25"
        }else if bMIValue<30{
            return "Overweight: 25 <= BMI < 30"
        }else{
            return "Obese: BMI >= 30"
        }
    }
}
