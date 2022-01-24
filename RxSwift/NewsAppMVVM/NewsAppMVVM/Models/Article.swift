//
//  Article.swift
//  NewsAppMVVM
//
//  Created by asher.enfj on 2022/01/24.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

