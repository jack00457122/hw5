//
//  kniferow.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct kniferow: View {
    var item: Item
    var body: some View {
        HStack(){
    KFImage(item.snippet.thumbnails.medium.url)
            .resizable()
            .scaledToFill()
            .frame(width: 145, height: 84)
            .clipped()
            Text(item.snippet.title)
            .bold()
        }
    }
}

struct kniferow_Previews: PreviewProvider {
    static var previews: some View {
        kniferow(item: Item(snippet: Snippet(title:"砂を電子レンジでチンして包丁を作る男とコーナーダッシュする女",description:"",thumbnails: Thumbnail(medium:Medium(url: URL(string:"https://i.ytimg.com/vi/qm9N_SPhwR8/mqdefault.jpg")!)))))
    }
}
