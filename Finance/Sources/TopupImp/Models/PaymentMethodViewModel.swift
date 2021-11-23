//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/22.
//

import UIKit
import FinanceEntity

struct PaymentMethodViewModel {
    let name: String
    let digits: String
    let color: UIColor
    
    init(_ paymentMethod: PaymentMethod) {
        name = paymentMethod.name
        digits = "**** \(paymentMethod.digits)"
        color = UIColor(hex: paymentMethod.color) ?? .systemGray
    }
}
