//
//  ApiManagementVM.swift
//  learninggoal
//
//  Created by Ousmane on 10/12/24.
//

import Foundation

class ApiManagementVM: ObservableObject{
    @Published var coins : [Datas] = [ ]
    
   
    
    func getCoins()  async throws{
        let endpoint = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=btc"
        if let url = URL(string: endpoint){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { datas, response, err in
                if err != nil{
                    print(err!.localizedDescription)
                }
                let decoder = JSONDecoder()
                if let safeData = datas{
                    do{
                        let coin = try decoder.decode([Datas].self, from: safeData)
                        DispatchQueue.main.async {
                            self.coins = coin
                        }
                        print(coin[1].image)
                    }catch let err as NSError{
                        print(err.localizedDescription)
                    }
                    
                   
                }
            }
            task.resume()
        }
    }
}
