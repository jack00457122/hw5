//
//  marvelrow.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct marvelrow: View {
    var result: Result
    var body: some View {
        HStack(){
            Image("錯誤")
                /*"/standard_xlarge.jpg"*/
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 120)
                .clipped()
                Text(result.name)
                .bold()
            }
    }
}

struct marvelrow_Previews: PreviewProvider {
    static var previews: some View {
        marvelrow(result:Result(name:"3-D Man",thumbnail:Thumbnail2(path:URL(string:"http://gateway.marvel.com/v1/public/characters/1011334")!)))
    }
}
