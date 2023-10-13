//
//  TransactionModel.swift
//  Spendbase
//
//  Created by Alisher on 13.10.2023.
//

import Foundation

struct Transaction {
    let card: Card
    let name: String
    let icon: String
    let date: Date
    let type: TransactionType
    let status: TransactionStatus
    let amount: Double
    let receiptAvailability: Bool
}
