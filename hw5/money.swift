//
//  money.swift
//  hw5
//
//  Created by User09 on 2020/6/23.
//  Copyright © 2020 00457122. All rights reserved.
//

import Foundation
struct Lover{
var money:Int
}
class LoversData:ObservableObject
{
@Published var lovers = [Lover]()
}
let loversData = LoversData()
let contentView = knifedetail(item: Item).environmentObject(loversData)
