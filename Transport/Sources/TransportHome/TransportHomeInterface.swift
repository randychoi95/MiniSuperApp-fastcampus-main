//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/23.
//

import Foundation
import ModernRIBs

public protocol TransportHomeBuildable: Buildable {
    func build(withListener listener: TransportHomeListener) -> ViewableRouting
}

public protocol TransportHomeListener: AnyObject {
    func transportHomeDidTapClose()
}
