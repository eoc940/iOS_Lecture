//
//  Article.swift
//  GoodNews
//
//  Created by asher.enfj on 2022/01/20.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
