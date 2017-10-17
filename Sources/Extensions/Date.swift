//
//  Date.swift
//  OXKit
//
//  Created by Dmitriy Azarov on 17/10/2017.
//  Copyright © 2017 Oxozle. All rights reserved.
//

import Foundation

extension Date {
    public static func from(_ year: Int, _ month: Int, _ day: Int) -> Date? {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: gregorianCalendar, year: year, month: month, day: day)
        return gregorianCalendar.date(from: dateComponents)
    }
}
