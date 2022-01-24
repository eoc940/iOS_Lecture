//
//  Articel.swift
//  GoodNews
//
//  Created by asher.enfj on 2022/01/24.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!
        return Resource(url: url)
    }()
    
}

struct Article: Decodable {
    let title: String
    let description: String? // response에 없는 경우도 있기 때문에 옵셔널로 해야 함. 안 그럴 경우 파싱이 안되어서 못 가져올 수도 있음
}
