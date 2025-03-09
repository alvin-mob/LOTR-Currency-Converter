//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by alvin-mob on 09/03/25.
//

import TipKit


struct CurrencyTip : Tip{
    
    var id: String = "CurrencyTip"
    
    var title: Text = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency section to bring up the Select Currency Screen")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
    
}
