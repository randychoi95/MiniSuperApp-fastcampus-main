//
//  AddPaymentMethodInfo.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/09.
//

import Foundation

public struct AddPaymentMethodInfo {
    public let number: String
    public let cvc: String
    public let expiry: String
    
    public init(
        number: String,
        cvc: String,
        expiry: String
    ) {
        self.number = number
        self.cvc = cvc
        self.expiry = expiry
    }
}
