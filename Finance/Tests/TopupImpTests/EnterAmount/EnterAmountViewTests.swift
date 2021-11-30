//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/30.
//

import Foundation
@testable import TopupImp
import XCTest
import SnapshotTesting
import FinanceEntity

final class EnterAmountVieTests: XCTestCase {
    
    func testExample() {
        // given
        let paymentMethod = PaymentMethod(
            id: "0",
            name: "슈퍼은행",
            digits: "**** 9999",
            color: "#51AF80FF",
            isPrimary: false
        )
        let viewModel = SelectedPaymentMethodViewModel(paymentMethod)
        
        // when
        let sut = EnterAmountViewController()
        sut.updateSelectedPaymentMethod(with: viewModel)
        
        // then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax))
    }
    
    func testExampleLoading() {
        // given
        let paymentMethod = PaymentMethod(
            id: "0",
            name: "슈퍼은행",
            digits: "**** 9999",
            color: "#51AF80FF",
            isPrimary: false
        )
        let viewModel = SelectedPaymentMethodViewModel(paymentMethod)
        
        // when
        let sut = EnterAmountViewController()
        sut.updateSelectedPaymentMethod(with: viewModel)
        sut.startLoading()
        
        // then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax))
    }
    
    func testExampleStopLoading() {
        // given
        let paymentMethod = PaymentMethod(
            id: "0",
            name: "슈퍼은행",
            digits: "**** 9999",
            color: "#51AF80FF",
            isPrimary: false
        )
        let viewModel = SelectedPaymentMethodViewModel(paymentMethod)
        
        // when
        let sut = EnterAmountViewController()
        sut.updateSelectedPaymentMethod(with: viewModel)
        sut.startLoading()
        sut.stopLoading()
        
        // then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneXsMax))
    }
    
}
