//
//  TopupRouter.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/09.
//

import ModernRIBs

protocol TopupInteractable: Interactable, AddPaymentMethodListener {
    var router: TopupRouting? { get set }
    var listener: TopupListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol TopupViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
    // this RIB does not own its own view, this protocol is conformed to by one of this
    // RIB's ancestor RIBs' view.
}

final class TopupRouter: Router<TopupInteractable>, TopupRouting {
    
    private var navigationControllable: NavigationControllerable?
    
    private let addPaymentMethodBuildable: AddPaymentMethodBuildable
    private var addPaymentMethodRouting: Routing?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(
        interactor: TopupInteractable,
        viewController: ViewControllable,
        addPaymentMethodBuildable: AddPaymentMethodBuildable
    ) {
        self.viewController = viewController
        self.addPaymentMethodBuildable = addPaymentMethodBuildable
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    func attachAddPaymentMethod() {
        if addPaymentMethodRouting != nil {
            return
        }
        
        let router = addPaymentMethodBuildable.build(withListener: interactor)
        
    }
    
    func detachAddPaymentMethod() {
        
    }
    
    private func presentInsideNavigation(_ viewControllerable: ViewControllable) {
        let navigation = NavigationControllerable(root: viewControllerable)
        navigation.navigationController.presentationController?.delegate = interactor.presentationDelegateProxy
        self.navigationControllable = navigation
        viewController.present(navigation, animated: true, completion: nil)
    }
    
    private func dismissPresentNavigation(completion: (() -> Void)?) {
        if self.navigationControllable == nil {
            return
        }
    }

    // MARK: - Private

    private let viewController: ViewControllable
}
