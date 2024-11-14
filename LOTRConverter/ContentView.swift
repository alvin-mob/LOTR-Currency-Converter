//
//  ContentView.swift
//  LOTRConverter
//
//  Created by alvin-mob on 18/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var showInfo : Bool = false
    @State var rightAmount = ""
    @State var leftAmount = ""
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
                            Image("silverpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                            Text("Silver Piece")
                                .foregroundColor(Color.white)
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
                            Image("goldpiece")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 25)
                            Text("Gold Piece")
                                .foregroundColor(Color.white)
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
