//
//  File.swift
//  
//
//  Created by 최제환 on 2021/11/26.
//

import Foundation
import ModernRIBs
import RIBsUtil
import RIBsTestSupport
import AddPaymentMethod
import FinanceEntity

public final class AddPaymentMethodBuildableMock: AddPaymentMethodBuildable {
    
    public var buildCallCount = 0
    public var closeButtonTyppe: DismissButtonType?
    public func build(withListener listener: AddPaymentMethodListener, closeButtonType: DismissButtonType) -> ViewableRouting {
        buildCallCount += 1
        self.closeButtonTyppe = closeButtonType
        
        return ViewableRoutingMock(
            interactable: Interactor(),
            viewControllable: ViewControllableMock())
        
    }
    
    public init() {
        
    }
}

public final class AddPaymentMethodListenerMock: AddPaymentMethodListener {
    public var addPaymentMethodDidTapCloseCallCount = 0
    public func addPaymentMethodDidTapClose() {
        addPaymentMethodDidTapCloseCallCount += 1
    }
    
    public var addPaymentMethodDidAddCardCallCount = 0
    public var addPaymentMethodDidAddCardPaymentMethod: PaymentMethod?
    public func addPaymentMethodDidAddCard(paymentMethod: PaymentMethod) {
        addPaymentMethodDidAddCardCallCount += 1
        addPaymentMethodDidAddCardPaymentMethod = paymentMethod
    }
    
    public init() {
        
    }
}
