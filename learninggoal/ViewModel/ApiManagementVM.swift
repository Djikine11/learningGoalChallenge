//
//  ApiManagementVM.swift
//  learninggoal
//
//  Created by Ousmane on 10/12/24.
//

import Foundation

class ApiManagementVM: ObservableObject{
    @Published var coins : [Datas] = []
   // @Published var videos : [VideoModel] = [ ]
    @Published var key = ""
    @Published var movieId = 0
    @MainActor
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
                           
                            print(coin[0].currentPrice)
                        }
                        
                    //    print(coin[1].currentPrice)
                    }catch let err as NSError{
                        print(err.localizedDescription)
                    }
                    
                    
                }
            }
            task.resume()
        }
    }
    
    func fetchVideo()async throws{
        let endpoint = "https://api.themoviedb.org/3/movie/157336/videos?api_key=0fcf46400e520c8862ea6263fb7de54a&language=en-US"
        
        if let url = URL(string: endpoint){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!.localizedDescription)
                }
                let decoder = JSONDecoder()
                if let safeData = data{
                    do{
                        let movies = try decoder.decode(VideoModel.self, from: safeData)
                        DispatchQueue.main.async {
                            let trailers = movies.results.filter({$0.type.contains("Trailer")})
                            self.key = trailers.first?.key ?? ""
                            
                            print(self.key)
                            
                            
                        }
                    }catch let err as NSError{
                        print(err.localizedDescription)
                    }
                }
                
            }
            task.resume()
           
        }
        
       
    }

}


