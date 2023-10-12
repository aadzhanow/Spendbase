//
//  SampleData.swift
//  Spendbase
//
//  Created by Alisher on 12.10.2023.
//

import UIKit

//MARK: - Sample Data Extension
extension HomeViewController {

    func loadSampleData() {
        // Cards
        let card1 = Card(cardName: "Visa", cardNumber: "1234-5678-1234-5678", linkedService: .Google)
        let card2 = Card(cardName: "Mastercard", cardNumber: "9876-5432-1987-6543", linkedService: .Slack)
        let card3 = Card(cardName: "Visa", cardNumber: "5678-9012-3456-7890", linkedService: .Notion)

        // Transactions for Card 1
        let transaction1Card1 = Transaction(card: card1, name: "Apple", icon: "coffeeIcon", date: Date(), type: .debit, status: .completed, amount: 5.99, receiptAvailability: true)
        let transaction2Card1 = Transaction(card: card1, name: "Uber", icon: "shoppingBagIcon", date: Date(), type: .debit, status: .completed, amount: 55.90, receiptAvailability: true)
        let transaction3Card1 = Transaction(card: card1, name: "Hotels", icon: "billIcon", date: Date(), type: .debit, status: .pending, amount: 150.00, receiptAvailability: false)

        // Transactions for Card 2
        let transaction1Card2 = Transaction(card: card2, name: "Dinner Out", icon: "restaurantIcon", date: Date(), type: .debit, status: .completed, amount: 35.50, receiptAvailability: true)
        let transaction2Card2 = Transaction(card: card2, name: "App Subscription", icon: "appIcon", date: Date(), type: .debit, status: .completed, amount: 9.99, receiptAvailability: true)
        let transaction3Card2 = Transaction(card: card2, name: "Grocery Shopping", icon: "groceryIcon", date: Date(), type: .debit, status: .completed, amount: 65.25, receiptAvailability: true)

        // Transactions for Card 3
        let transaction1Card3 = Transaction(card: card3, name: "Flight Booking", icon: "planeIcon", date: Date(), type: .debit, status: .pending, amount: 250.00, receiptAvailability: false)
        let transaction2Card3 = Transaction(card: card3, name: "Gas Station", icon: "gasIcon", date: Date(), type: .debit, status: .completed, amount: 30.00, receiptAvailability: true)
        let transaction3Card3 = Transaction(card: card3, name: "Movie Tickets", icon: "movieIcon", date: Date(), type: .debit, status: .completed, amount: 20.00, receiptAvailability: false)

//        // Arrays for easy access
//        let cards = [card1, card2, card3]
//        let transactionsCard1 = [transaction1Card1, transaction2Card1, transaction3Card1]
//        let transactionsCard2 = [transaction1Card2, transaction2Card2, transaction3Card2]
//        let transactionsCard3 = [transaction1Card3, transaction2Card3, transaction3Card3]
    }
    
}
