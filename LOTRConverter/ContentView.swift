//
//  ContentView.swift
//  LOTRConverter
//
//  Created by alvin-mob on 18/03/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showInfo : Bool = false
    @State var showSelectedCurrency : Bool = false
    @State var rightAmount = ""
    @State var leftAmount = ""
    @State var leftCurrency = Currency.goldPiece
    @State var rightCurrency = Currency.goldPenny
    @FocusState var leftTyping : Bool
    @FocusState var rightTyping : Bool
    let currencyTip : CurrencyTip = CurrencyTip()
    var body: some View {
        ZStack(){
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack(){
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                HStack(){
                    VStack(){
                        HStack(){
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                            Text(leftCurrency.name)
                                .foregroundColor(Color.white)
                        }.onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed )
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        // Textfield here
                        TextField("Amount",
                                  text: $leftAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
                        .focused($leftTyping)
                    
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack(){
                        HStack(){
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                            Text(rightCurrency.name)
                                .foregroundColor(Color.white)
                        }.onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed )
                        }
                        
                        // TextField here
                        TextField("Amount",
                                  text: $rightAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
                        .focused($rightTyping)
                    }
                }.padding()
                    .background(Color.black)
                    .clipShape(Capsule())
                Spacer()
                HStack {
                    Spacer()
                    Button{
                        showInfo.toggle()
                        print("showInfo : \(showInfo)")
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }.padding(.trailing)
                }
            }
           
        }
        .task {
            try? Tips.configure()
        }
        .keyboardType(.decimalPad)
        .onChange(of: leftAmount, {
            if(leftTyping) {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        })
        .onChange(of: rightAmount,  {
            if(rightTyping) {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        })
        .onChange(of: leftCurrency, {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        })
        .onChange(of: rightCurrency, {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        })
       
        .sheet(isPresented: $showInfo, content: {
            ExchangeInfoView()
        }
        )
        .sheet(isPresented: $showSelectedCurrency, content:{
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
