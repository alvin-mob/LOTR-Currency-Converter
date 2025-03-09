//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by alvin-mob on 05/12/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss;
    @Binding var topCurrency : Currency
    @Binding var bottomCurrency: Currency
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(Color.brown)
            VStack{
        
                
                Text("Select the currency you are starting with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                IconGrid(currency: $topCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top,10)
            
            
                
//                CurrencyIcon(currencyImage: .goldpenny, currencyName: "Gold Penny")
                IconGrid(currency: $bottomCurrency)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
   
    @State var leftCurrency : Currency = Currency.silverPiece
    @State var rightCurrency: Currency = Currency.goldPiece
    return SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
}



