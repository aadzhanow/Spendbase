//
//  CardModels.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import Foundation

struct Card {
    let cardName: String
    let cardNumber: String
    let linkedService: AvailableServices
}

enum AvailableServices: String {
    case Slack
    case Google
    case Notion
}

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

enum TransactionStatus: String {
    case completed
    case pending
    case failed
}

enum TransactionType: String {
    case credit
    case debit
}
