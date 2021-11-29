//
//  Date+getFormattedDate.swift
//  Translatein
//
//  Created by Yossan Rahmadi on 29/11/21.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
