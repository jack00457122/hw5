//
//  knifelist.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct knifelist: View {
        @State private var Search = ""
        @State private var opacity: Double = 0
        @State private var items = [Item]()
        @State private var showknifedetail = false
        @State private var nowIndex = 0
        let screenSize: CGRect = UIScreen.main.bounds
        
        func GetSearch(){
            
            let urlStr = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails,status&playlistId=UUg3qsVzHeUt5_cPpcRtoaJQ&key=AIzaSyBXt7BAW8IgZU3dh8xVcFMGMTVWtoML0jU&maxResults=20"
            let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            if let url = URL(string: newUrl) {
                URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data {
                    do{
                        let searchResults = try JSONDecoder().decode(SearchObject.self, from: data)
                        self.items = searchResults.items
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
            Image("Youtube")
                .resizable()
                .scaledToFit()
                .frame(width:360,height:140)
                .opacity(opacity)
                .onAppear{
                    if self.opacity != 0{
                        self.opacity = 0
                        withAnimation (Animation.linear(duration: 2)){
                           self.opacity += 0.5
                        }
                    }
                    else{
                        withAnimation (Animation.linear(duration: 2)){
                           self.opacity += 0.5
                        }
                    }
                }
                List(items.indices, id: \.self) { (index)  in
                    kniferow(item: self.items[index])
                        .onTapGesture {
                           self.showknifedetail = true
                           self.nowIndex = index
                        }
                    }.sheet(isPresented: self.$showknifedetail) {
                        knifedetail(item: self.items[self.nowIndex])
                }
                .onAppear {
                    if self.items.count == 0 {
                        self.GetSearch()
                    }
                }
                Spacer()
            }.frame(height: screenSize.height)
            }
        }
    }

struct knifelist_Previews: PreviewProvider {
    static var previews: some View {
        knifelist()
    }
}
