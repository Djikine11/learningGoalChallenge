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
        Text(items.symbol)
    }
}

#Preview {
    CoinDetailsView(items: Datas(id: "", symbol: "", image: ""))
}
