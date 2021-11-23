//
//  AppRootComponent.swift
//  MiniSuperApp
//
//  Created by 최제환 on 2021/11/23.
//

import Foundation
import AppHome
import FinanceHome
import ProfileHome
import FinanceRepository
import ModernRIBs
import TransportHome
import TransportHomeImp
import Topup
import TopupImp
import AddPaymentMethod
import AddPaymentMethodImp

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency, FinanceHomeDependency, ProfileHomeDependency, TransportHomeDependency, TopupDependency, AddPaymentMethodDependency {
    var cardOnFileRepository: CardOnFileRepository
    var superPayRepository: SuperPayRepository
    
    lazy var transportHomeBuildable: TransportHomeBuildable = {
        return TransportHomeBuilder(dependency: self)
    }()
    
    lazy var topupBuildable: TopupBuildable = {
        return TopupBuilder(dependency: self)
    }()
    
    lazy var addPaymentMethodBuildable: AddPaymentMethodBuildable = {
        return AddPaymentMethodBuilder(dependency: self)
    }()
    
    var topupBaseViewController: ViewControllable { rootViewController.topViewControllable }
    
    private let rootViewController: ViewControllable
    
    init(
        dependency: AppRootDependency,
        cardOnFileRepository: CardOnFileRepository,
        superPayRepository: SuperPayRepository,
        rootViewController: ViewControllable
    ) {
        self.cardOnFileRepository = cardOnFileRepository
        self.superPayRepository = superPayRepository
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}
