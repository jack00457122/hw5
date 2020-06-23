//
//  marveldetail.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI
struct marveldetail: View {
    var result: Result
    var body: some View {
        VStack{
        Group{
            Text(result.name)
            .font(Font.system(size: 50))
            .position(x:200 , y:60)
            .foregroundColor(.yellow)
            Text("分類：漫威英雄")
                .font(Font.system(size: 30))
                .position(x:200 , y:-20)
                .foregroundColor(.red)
            Text("角色簡介 : ")
                .font(Font.system(size: 40))
                .position(x:200 , y:-100)
                .foregroundColor(.blue)
            Text("這角色還沒有簡介，請移至官網：")
            .font(Font.system(size: 40))
            .frame(width:400 ,height:200)
            .position(x:200 , y:-60)
            .font(.system(size: 100, weight: .regular, design: .rounded))
            Text("https://www.marvel.com/characters")
            .font(Font.system(size: 30))
            .position(x:200 , y:-100)
            .foregroundColor(.blue)
            Image("官網")
            .resizable()
            .scaledToFill()
            .frame(width: 380, height: 200)
            .clipped()
            .position(x:207 , y:-100)
        }
            }
    }
}

struct marveldetail_Previews: PreviewProvider {
    static var previews: some View {
        marveldetail(result:Result(name:"3-D Man",thumbnail:Thumbnail2(path:URL(string:"http://gateway.marvel.com/v1/public/characters/1011334")!)))
    }
}
