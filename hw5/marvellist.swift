//
//  marvellist.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct marvellist: View {
                @State private var Search2 = ""
                @State private var results = [Result]()
                @State private var showmarveldetail = false
                @State private var nowIndex2 = 0
                let screenSize2: CGRect = UIScreen.main.bounds
                
                func GetSearch2(){
                    
                    let urlStr = "https://gateway.marvel.com/v1/public/characters?ts=614070759.937579&apikey=1f2d80856abe29ce9bdea186ac2a530b&hash=796dbc76789f24dd86cb6096317d3e20"
                    let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    if let url = URL(string: newUrl) {
                        URLSession.shared.dataTask(with: url) { (data, response , error) in
                        if let data = data {
                            do{
                                let searchResults = try JSONDecoder().decode(SearchObject2.self, from: data)
                                self.results = searchResults.datas.results
                            }
                            catch{
                                print(error)
                            }
                        }
                        }.resume()
                    }
                }
            var body: some View {
                    NavigationView {
                    VStack {
                    Image("marvel")
                        .resizable()
                        .scaledToFit()
                        .frame(width:360,height:140)
                        List(results.indices, id: \.self) { (index)  in
                            marvelrow(result: self.results[index])
                                .onTapGesture {
                                   self.showmarveldetail = true
                                   self.nowIndex2 = index
                                }
                            }.sheet(isPresented: self.$showmarveldetail) {
                                marveldetail(result: self.results[self.nowIndex2])
                        }
                        .onAppear {
                            if self.results.count == 0 {
                                self.GetSearch2()
                            }
                        }
                        Spacer()
                    }.frame(height: screenSize2.height)
                    }
                }
            }

struct marvellist_Previews: PreviewProvider {
    static var previews: some View {
        marvellist()
    }
}
