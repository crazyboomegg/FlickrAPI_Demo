//
//  FeedData.swift
//  SearchFlickerDemo
//
//  Created by 江柏毅 on 2020/11/1.
//

import Foundation


struct Media: Decodable {
    let m: URL
}
struct Item: Decodable {
    let title: String
    let media: Media
    let author: String
}
struct FeedData: Decodable {
    let items: [Item]
}
