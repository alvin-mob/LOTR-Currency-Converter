//
//  IconGrid.swift
//  LOTRConverter
//

//

import SwiftUI

struct IconGrid: View {
    
    @State var currency : Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], content: {
            
            ForEach(Currency.allCases){ currency in
                if(self.currency == currency){
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .overlay{
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                    
                }
                
                
                
            }
            
        })
    }
}


#Preview {
    IconGrid(currency: .copperPenny)
}
