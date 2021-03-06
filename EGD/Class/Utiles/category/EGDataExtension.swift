//
//  EGDataExtension.swift
//  EGD
//
//  Created by jieku on 2017/6/6.
//
//

import UIKit

extension Date {
    
    /// 返回是否是今年
    var hw_isInThisYear: Bool {
        let selfYear = Calendar.hw_calendar.component(.year, from: self)
        let currentYear = Calendar.hw_calendar.component(.year, from: Date())
        return selfYear == currentYear
    }
    
    /// 返回是否是今天
    var hw_isInToday: Bool {
        let selfComponents = Calendar.hw_calendar.dateComponents([.year,.month,.day], from: self)
        let currentComponents = Calendar.hw_calendar.dateComponents([.year,.month,.day], from: Date())
        return (selfComponents.year! == currentComponents.year!)
            && (selfComponents.month! == currentComponents.month!)
            && (selfComponents.day! == currentComponents.day!)
    }
    
    /// 返回是否是昨天
    var hw_isInYesterday: Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let date = formatter.date(from: formatter.string(from: self))!
        let newDate = date.addingTimeInterval(60*60*24)
        return newDate.hw_isInToday
    }
}


extension Calendar {
    
    static var hw_calendar: Calendar {
        let calendar: Calendar
        if #available(iOS 8.0, *) {
            calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        } else {
            calendar = Calendar.current
        }
        return calendar
    }
    
}
