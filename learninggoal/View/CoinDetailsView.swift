//
//  CoinDetailsView.swift
//  learninggoal
//
//  Created by Ousmane on 13/12/24.
//

import SwiftUI



struct CoinDetailsView: View {
    var   items:  Datas
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 150,height: 50)
                .foregroundStyle(Color.gray)
            Text(items.symbol)
            Text("\(items.currentPrice)")
            
        }
       
    }
}

#Preview {
    CoinDetailsView(items: Datas(id: "", symbol: "", image: "",currentPrice: 1))
}
