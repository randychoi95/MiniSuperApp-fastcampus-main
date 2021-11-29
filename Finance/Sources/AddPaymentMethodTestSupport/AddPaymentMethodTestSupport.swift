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
