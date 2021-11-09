//
//  PaymentModel.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/09.
//

import Foundation

struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
