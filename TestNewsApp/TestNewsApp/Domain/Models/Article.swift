//
//  Article.swift
//  TestNewsApp
//
//  Created by Natalia  Stele on 01/06/2021.
//

import Foundation

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let articleDescription: String?
    let image: String?
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article {
    static var testArticle: Article {
        .init(author: "Hanna Ziady, CNN Business",
              url: "https://www.cnn.com/2021/06/01/business/naomi-osaka-nike-sponsors/index.html",
              source: "CNN",
              title: "Nike backs Naomi Osaka after she withdraws from French Open - CNN",
              articleDescription: "Nike and other major sponsors have come out in support of tennis star Naomi Osaka following her decision to withdraw from the French Open.",
              image: "https://cdn.cnn.com/cnnnext/dam/assets/210601060832-naomi-osaka-0526-restricted-super-tease.jpg",
              date: Date())
    }
}

