//
//  marvel.swift
//  hw5
//
//  Created by User09 on 2020/6/17.
//  Copyright © 2020 00457122. All rights reserved.
//

import CryptoKit
import Foundation
let ts = Date().timeIntervalSinceReferenceDate
let privateKey = "ccbe8c4642a7038ad634694c274021b4a8e75bb0"
let publicKey = "1f2d80856abe29ce9bdea186ac2a530b"
let md5InputData = "\(ts)\(privateKey)\(publicKey)".data(using: .utf8)!
let digest = Insecure.MD5.hash(data: md5InputData)
let hashString = digest.map {
    String(format: "%02x", $0)
}.joined()
let urlString = "https://gateway.marvel.com/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hashString)"
/*if let url = URL(string: urlString) {
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let data = data, let content = String(data: data, encoding: .utf8) {
            print(content)
        }
    }.resume()
}*/
