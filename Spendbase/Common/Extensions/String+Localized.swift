//
//  String+Localized.swift
//  Spendbase
//
//  Created by Alisher on 17.10.2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
