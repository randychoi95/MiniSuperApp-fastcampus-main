//
//  Array+Utils.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/11.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
