//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/22.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
