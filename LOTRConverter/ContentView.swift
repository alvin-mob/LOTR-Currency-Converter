//
//  ContentView.swift
//  LOTRConverter
//
//  Created by alvin-mob on 18/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var showInfo : Bool = false
    @State var showSelectedCurrency : Bool = false
    @State var rightAmount = ""
    @State var leftAmount = ""
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece
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
                        }
                        // Textfield here
                        TextField("Amount",
                                  text: $rightAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
                    
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        // need ios 17
                        //.symbolEffect(.pulse)
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
                        }
                        
                        // TextField here
                        TextField("Amount",
                                  text: $leftAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
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
//                Image(systemName: "info.circle.fill")
//                    .foregroundColor(.white)
//                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
           
        }.sheet(isPresented: $showInfo, content: {
            ExchangeInfoView()
        }
        )
        .sheet(isPresented: $showSelectedCurrency, content:{
            SelectCurrency(topCurrency: leftCurrency, bottomCurrency: rightCurrency)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
