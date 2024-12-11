//
//  Home.swift
//  learninggoal
//
//  Created by Ousmane on 09/12/24.
//

import SwiftUI

struct Home: View {
   @StateObject private var vm = ApiManagementVM()
    var body: some View {
        List{
            ForEach(vm.coins, id: \.id){datas in
               // Text(datas.id)
                CoinView(item: datas.id, itemImage: datas.image)
            }
        }.task {
         try!   await vm.getCoins()
        }
    }
}

#Preview {
    Home()
}

struct CoinView: View {
    var item: String
    var itemImage: String
    var body: some View {
        HStack{
            Text(item).bold()
            Spacer()
            AsyncImage(url: URL(string: itemImage)){image in
                image.image?.resizable()
                    .frame(width: 50, height: 50)
                    
            }
            let _: Void = UserDefaults.standard.set("a", forKey: "k")
        }
    }
}
