//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Abraham Cyriac on 19/07/24.
//

import SwiftUI

struct ExchangeRate: View {
    let rightImage : ImageResource
    let leftImage : ImageResource
    let text : String
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

#Preview {
    ExchangeRate(rightImage: .goldpenny, leftImage: .goldpiece, text: "1 Gold piece = 100 Gold penny")
}
