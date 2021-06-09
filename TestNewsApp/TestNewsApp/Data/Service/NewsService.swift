//
//  NewsService.swift
//  TestNewsApp
//
//  Created by Natalia  Stele on 01/06/2021.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { error in
                APIError.errorCode(error.errorCode)
            }
            .flatMap { data, response -> AnyPublisher<NewsResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }

            }
            .eraseToAnyPublisher()
    }
}
