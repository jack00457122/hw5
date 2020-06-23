//
//  map.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    
    var annotations = [MKPointAnnotation]()
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
       
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
        uiView.showAnnotations(annotations, animated: true)
    }
}
struct map: View {

    @State private var offset = CGSize.zero
    @State private var newPosition = CGSize.zero
     @State private var annotations = [MKPointAnnotation]()
    @State private var win = 0
    var body: some View {
        ZStack{
        VStack {
            Button("進行戰鬥") {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: Double.random(in: 20...30), longitude: Double.random(in: 110...130))
                annotation.title = "latitude \(annotation.coordinate.latitude)"
                annotation.subtitle = "longitude \(annotation.coordinate.longitude)"
                self.annotations.append(annotation)
                self.win+=1
            }
            MapView(annotations: annotations)
            Text("已從\(win)個地點擊敗敵人")
        }
            if (win==0){
            Image("準備")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 50)
            .offset(x: 0, y: -360)
                .offset(offset)
                .gesture(DragGesture()
                    .onChanged({ (value) in
                        self.offset=CGSize(width: value.translation.width+self.newPosition.width, height: value.translation.height+self.newPosition.height)
                                 })
                    .onEnded({ (value) in
                        self.newPosition=self.offset
                                 }))
            }
        }
    }
}

struct map_Previews: PreviewProvider {
    static var previews: some View {
        map()
    }
}
