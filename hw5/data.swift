//
//  data.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import Foundation

struct Medium: Codable{
    var url:URL
}

struct Thumbnail: Codable{
    var medium:Medium
}

struct Snippet: Codable {
    var title:String
    var description:String
    var thumbnails:Thumbnail
}

struct Item: Codable {
    var snippet:Snippet
}

struct SearchObject: Codable{
    var items:[Item]
}
