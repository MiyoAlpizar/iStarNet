//
//  Number+Extensions.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import Foundation

extension Decimal {
    var asLocaleCurrency:String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(from: self as NSNumber)!
    }
}
