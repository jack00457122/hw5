//
//  CheckImage.swift
//  hw5
//
//  Created by User09 on 2020/6/23.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI

struct CheckImage: View {
    @State private var selectImage = Image (systemName: "camera.on.rectangle.fill" )
    @State private var showSelectPhoto = false
    @State private var showWebpage = false 
    var body: some View {
        VStack{
            Button(action: {self.showSelectPhoto=true
            }) {
                selectImage
                    .resizable()
                    .scaledToFit()
                    .clipped()
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented:$showSelectPhoto) {
                ImagePickerController(showselectPhoto: self.$showWebpage, selectImage: self.$selectImage)
            }
        }
    }
}
}

struct CheckImage_Previews: PreviewProvider {
    static var previews: some View {
        CheckImage()
    }
}
