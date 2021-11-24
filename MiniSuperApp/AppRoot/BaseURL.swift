//
//  BaseURL.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/24.
//

import Foundation

struct BaseURL {
    var financeBaseURL: URL {
        return URL(string: "https://finance.superapp.com/api/v1")!
    }
}
