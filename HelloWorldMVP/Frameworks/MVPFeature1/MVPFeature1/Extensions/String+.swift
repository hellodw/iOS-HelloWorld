//
//  String+.swift
//  MVPFeature1
//
//  Created by maverick.b on 2022/08/11.
//

import Foundation

extension String {
    enum DateType: String {
        /// yyyy-MM-dd hh:mm:ss.SSSSSS
        case type1 = "yyyy-MM-dd hh:mm:ss.SSSSSS"
    }
    
    func convertToDate(type: DateType) -> Date? {
        let df = DateFormatter()
        df.dateFormat = type.rawValue
        df.timeZone = TimeZone(identifier: Locale.current.identifier)
        df.locale = Locale(identifier: Locale.current.identifier)
        df.calendar = Calendar(identifier: .iso8601)
        return df.date(from: self)
    }
}
