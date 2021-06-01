//
//  NewsEndpoint.swift
//  TestNewsApp
//
//  Created by Natalia  Stele on 01/06/2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}


enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {

    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }

    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: baseURL.appendingPathComponent(path))
        }
    }

    var path: String {
        switch self {
        case .getNews:
            return "/news"
        }
    }
}
