//
//  ExchangeInfoView.swift
//  LOTRConverter
//
//  Created by alvin-mob on 18/07/24.
//

import SwiftUI

struct ExchangeInfoView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(Color.brown)
            VStack{
                Text("Exchange Rate")
                    .font(.largeTitle)
                    .tracking(2)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                ExchangeRate(rightImage: .silverpiece, leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces")
                ExchangeRate(rightImage: .silverpenny, leftImage: .silverpiece, text: "1 Silver piece = 4 Silver pennies")
                ExchangeRate(rightImage: .goldpenny, leftImage: .goldpiece, text: "1 Gold piece = 100 Gold pennies")
                ExchangeRate(rightImage: .goldpenny, leftImage: .goldpiece, text: "1 Gold piece = 100 Gold pennies")
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
                
            }.foregroundColor(.black)
        }
    }
}

#Preview {
    ExchangeInfoView()
}


