//
//  CardOnFileInteractor.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/10.
//

import ModernRIBs

protocol CardOnFileRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CardOnFilePresentable: Presentable {
    var listener: CardOnFilePresentableListener? { get set }
    
    func update(with viewModels: [PaymentMethodViewModel])
}

protocol CardOnFileListener: AnyObject {
    func cardOnFileDidTapClose()
    func cardOnFileDidTapAddCard()
    func cardOnDidSelect(at index: Int)
}

final class CardOnFileInteractor: PresentableInteractor<CardOnFilePresentable>, CardOnFileInteractable, CardOnFilePresentableListener {
    
    weak var router: CardOnFileRouting?
    weak var listener: CardOnFileListener?
    
    private let paymentMethos: [PaymentMethod]
    
    init(
        presenter: CardOnFilePresentable,
        paymentMethods: [PaymentMethod]
    ) {
        self.paymentMethos = paymentMethods
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        presenter.update(with: paymentMethos.map(PaymentMethodViewModel.init))
    }
    
    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapClose() {
        listener?.cardOnFileDidTapClose()
    }
    
    func didSelectItem(at index: Int) {
        if index >= paymentMethos.count {
            listener?.cardOnFileDidTapAddCard()
        } else {
            listener?.cardOnDidSelect(at: index)
        }
    }
}
