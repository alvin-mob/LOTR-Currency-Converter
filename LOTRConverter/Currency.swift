//
//  currency.swift
//  LOTRConverter
//
//

import SwiftUI

enum Currency : Double, CaseIterable, Identifiable {
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency {self}
    //var id : Double {rawValue}
    var image : ImageResource{
        switch self{
        case .copperPenny : .copperpenny
        case .silverPenny : .silverpenny
        case .silverPiece : .silverpiece
        case .goldPenny : .goldpenny
        case .goldPiece : .goldpiece
        }
    }
    
    var name : String{
        switch self{
        case .copperPenny : "Copper Penny"
        case .silverPenny : "Silver Penny"
        case .silverPiece : "Silver Piece"
        case .goldPenny : "Gold Penny"
        case .goldPiece :  "Gold Piece"
         }
    }
    
    func convert(_ amountString : String, to currency : Currency)-> String {
        
        guard let amountDouble : Double = Double(amountString) else {
            return ""
        }
        
        let convertAmount = (amountDouble/self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertAmount)
    }
}

