//
//  ContentView.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            knifelist().tabItem{
                Image(systemName: "list.bullet")
                Text("菜刀製作")
            }
            marvellist().tabItem{
                Image(systemName: "book.circle")
                Text("替身選擇")
            }
            map().tabItem{
                Image(systemName:"magnifyingglass")
                Text("尋找對手")
            }
            CheckImage().tabItem{
                Image(systemName:"eye.fill")
                Text("確認戰力")
            }
        }.accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
