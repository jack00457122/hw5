//
//  knifedetail.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct knifedetail: View {
    @State private var money = 300
    var item: Item
    var body: some View {
        
        VStack{
        Group{
                    
            Text(item.snippet.title)
            .font(Font.system(size: 36))
            .position(x:200 , y:250)
            .foregroundColor(.yellow)
            Text("製作者：圧倒的不審者の極み!" )
                .font(Font.system(size: 28))
                .position(x:200 , y:210)
                .foregroundColor(.red)
            Text("影片簡介 : ")
                .font(Font.system(size: 30))
                .position(x:200 , y:120)
                .foregroundColor(.blue)
            Text(item.snippet.description)
            .font(Font.system(size: 20))
            .frame(width:400 ,height:400)
            .position(x:200 , y:210)
            .font(.system(size: 100, weight: .regular, design: .rounded))
            Button("購買一把"){
                self.money -= 100
            }.position(x:200 , y:280)
            HStack{
            Image("金幣")
            .resizable()
            .scaledToFit()
            .frame(width:100,height:100)
            .position(x:160 , y:200)
                Text("$\(money)$")
                .font(Font.system(size: 50))
                .position(x:100 , y:200)
                .foregroundColor(.yellow)
            }
        }
        .frame(width:400 ,height:680)
        .position(x:200 , y:185)
            }
    }
}


struct knifedetail_Previews: PreviewProvider {
    static var previews: some View {
        knifedetail(item: Item(snippet: Snippet(title:"砂を電子レンジでチンして包丁を作る男とコーナーダッシュする女",description:"アニメに憧れたとある面識の無い男女。女はコーナーダッシュで出会いを求め、男はプレゼント攻撃で出会いを求める。しかし、女が口に加えたのは食パンでは無くキュウリだった。そして包丁を作りキュウリを切ることが趣味とする男を引き寄せてしまう真の運命の出会い恋愛シュミレーション動画\n\nこの動画は海岸の砂から砂鉄、硅砂を取り出し電子レンジでテルミット反応を起こして鉄を作り、マイクロ波の加熱によってガラスを作る教育ドキュメンタリー動画です\n\n※特殊な道具を使用しており、安全に作業ができておりますので真似しないでください\n\n＃JapaneseknifeMan",thumbnails: Thumbnail(medium:Medium(url: URL(string:"https://i.ytimg.com/vi/qm9N_SPhwR8/mqdefault.jpg")!)))))
    }
}
