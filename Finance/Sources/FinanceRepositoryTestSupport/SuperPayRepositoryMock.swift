//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/25.
//

import Foundation
import FinanceRepository
import CombineUtil
import Combine

public final class SuperPayRepositoryMock: SuperPayRepository {
    
    public var balanceSubject = CurrentValuePublisher<Double>(0)
    public var balance: ReadOnlyCurrentValuePublisher<Double> { balanceSubject }
    
    public var topupCallCount = 0
    public var topupAmount: Double?
    public var paymentMethodID: String?
    public var shouldTopupSuccess: Bool = true
    
    public func topup(amount: Double, paymentMethodID: String) -> AnyPublisher<Void, Error> {
        topupCallCount += 1
        topupAmount = amount
        self.paymentMethodID = paymentMethodID
        
        if shouldTopupSuccess {
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        } else {
            return Fail(error: NSError(domain: "SuperPayRepositoryMock", code: 0, userInfo: nil)).eraseToAnyPublisher()
        }
    }
    
    public init() {
        
    }
}

