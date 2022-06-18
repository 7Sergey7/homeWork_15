//
//  main.swift
//  homeWork_15
//
//  Created by Seroj on 17.06.22.
//

import Foundation


//homeWork 15.1
/* Ստեղծել class որը MyTime անունով որը պետք է ունենա ժամանակը բնութագրող property-եր (ժամ, րոպե, վարկյան)։
 Այս կլասի էկզեմպլայրը պետք է ունոնոա հետևյալ մեթոդները՝։
 - փոխել ժամի սկզբնական արժեքը
 - փոխել րոպեի սկզբնական արժեքը
 - փոկել վարկյանի սկզբնական արժեքը
 - վերադաձնի ժամի տեքստային տարբերակը այս ֆորմատով hh:mm:ss (23:45:31)
 - տպի ժամի տեքստային տարբերակը այս ֆորմատով hh:mm:ss (23:45:31)
 - ունենալ addSecond ֆունկցիա որը կավելացնի ընդանուր ժամին վարկյաներ և կաղված արժեքից կփոխի րոպեն և ժամը */

class MyTime {
    
    var hour: Int = 13
    var minute: Int = 03
    var second: Int = 13
    
    var stringHour: String {
            if hour >= 0 && hour <= 9 {
                return "0\(hour)"
        }
        return "\(hour)"
    }
    
    var stringMinute: String {
            if minute >= 0 && minute <= 9 {
                return "0\(minute)"
        }
        return "\(minute)"
    }
    
    var stringSecond: String {
            if second >= 0 && second <= 9 {
                return "0\(second)"
        }
        return "\(second)"
    }

    func setHour(_ myHour: Int) {
        if myHour < 24 && myHour >= 0 {
            hour = myHour
        }
    }

    func setMinute(_ myMinute: Int) {
        if myMinute < 60 && myMinute >= 0 {
            minute = myMinute
        }
    }

    func setSecond(_ mySecond: Int) {
        if mySecond < 60 && mySecond >= 0 {
            second = mySecond
        }

    }

    func getTime() -> String {
        "hh:mm:ss (\(stringHour):\(stringMinute):\(stringSecond))"
    }

    func printTime() {
        print("hh:mm:ss (\(stringHour):\(stringMinute):\(stringSecond))")
    }

    func addSecond(_ addSec: Int) {

        let saveMinute = (addSec + second) / 60

        if second + addSec > 59 {
            second = (addSec + second) % 60

        } else if addSec > 0 {
            second += addSec
        }

        minute += saveMinute

        if minute > 59 {
            
            hour = hour + minute / 60
            minute = minute % 60
            
            if hour > 23 {
                hour = 23
            }
            
        }
    }
}
let timeExemp = MyTime()

//timeExemp.setMinute(58)
//timeExemp.setHour(07)
//timeExemp.setSecond(03)

timeExemp.addSecond(01)
timeExemp.printTime()


//homeWork 15.2
/* Ստեղծել class որը MyDate անունով որը պետք է ունենա ամսաթիվը  և ժամանակը բնութագրող property-եր (օր, ամիս, տարի, MyTime տիպի property-ի որը ստեղծվել էր առաջին խնդրում)։
 Այս կլասի էկզեմպլայրը պետք է ունոնոա հետևյալ մեթոդները՝։
 - փոխել օրվա սկզբնական արժեքը
 - փոխել ամսվա սկզբնական արժեքը
 - փոխել տարվա սկզբնական արժեքը
 - փոխել ժամի սկզբնական արժեքը
 - փոխել րոպեի սկզբնական արժեքը
 - փոկել վարկյանի սկզբնական արժեքը
 - վերադաձնի ամսաթիվի տեքստային տարբերակը այս ֆորմատով dd:mm:yyyy hh:mm:ss (02:03:2022 23:45:31)
 - տպի ժամի տեքստային տարբերակը այս ֆորմատով hh:mm:ssdd:mm:yyyy hh:mm:ss (02:03:2022 23:45:31)
 ունենալ addSecond ֆունկցիա որը կավելացնի ընդանուր ժամին վարկյաներ և կաղված արժեքից կփոխի րոպեն և ժամը, օրը, ամիսը, տարին */

class MyDate {
    
    var day: Int = 07
    var month: Int = 02
    var year: Int = 2022
    var time = MyTime()
    
    var stringDay: String {
            if day >= 0 && day <= 9 {
                return "0\(day)"
        }
        return "\(day)"
    }
    
    var stringMonth: String {
            if month >= 0 && month <= 9 {
                return "0\(month)"
        }
        return "\(month)"
    }
    
    func setDay(_ myDay: Int) {
        if myDay > 0 && myDay <= 30 {
            day = myDay
        }
    }
    
    func setMonth(_ myMonth: Int) {
        if myMonth > 0 && myMonth <= 12 {
            month = myMonth
        }
    }
    
    func setYear(_ myYear: Int) {
        if myYear > 0 {
            year = myYear
        }
    }
    
    func setHourInDate(_ dateHour: Int) {
        
        time.setHour(dateHour)
    }
    
    func setMinuteInDate(_ dateMinute: Int) {

        time.setMinute(dateMinute)
    }
    
    func setSecondInDate(_ dateSecond: Int) {
        
        time.setSecond(dateSecond)
    }
    
    func getDateAndTime() -> String {
        "dd:mm:yyyy (\(stringDay):\(stringMonth):\(year)) | \(time.getTime())"
    }
    
    func printDateAndTime() {
        print("dd:mm:yyyy (\(stringDay):\(stringMonth):\(year)) | \(time.getTime())")
    }
    
    func addSecondInDate(_ addSec: Int) {

        let a = (addSec + time.second) / 60

        if time.second + addSec > 59 {
            time.second = (addSec + time.second) % 60

        } else if addSec > 0 {
            time.second += addSec
        }

        time.minute += a

        if time.minute > 59 {
            
            time.hour = time.hour + time.minute / 60
            time.minute %= time.minute
        }
            
        if time.hour > 24 {
            day = day + time.hour / 24
            time.hour %= 24
        }
            
        if day > 30 {
            month = month + day / 30
            day %= 30
        }
        
        if month > 12 {
            year = year + month / 12
            month %= 12
        }
    }
}

let dateExemp = MyDate()

//dateExemp.setDay(09)
//dateExemp.setMonth(07)
//dateExemp.setYear(2023)
//dateExemp.setHourInDate(22)
//dateExemp.setMinuteInDate(44)
//dateExemp.setSecondInDate(08)

dateExemp.addSecondInDate(999)
dateExemp.printDateAndTime()






    
