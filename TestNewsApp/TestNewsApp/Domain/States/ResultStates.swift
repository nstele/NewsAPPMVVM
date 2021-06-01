//
//  ResultStates.swift
//  TestNewsApp
//
//  Created by Natalia  Stele on 01/06/2021.
//

import Foundation

enum ResultStates {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
