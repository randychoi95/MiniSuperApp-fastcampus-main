//
//  NumberFormatter.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/04.
//

import Foundation

struct Formatter {
    static let balanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
