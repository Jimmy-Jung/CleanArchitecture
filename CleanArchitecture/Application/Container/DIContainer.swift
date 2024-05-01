//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

protocol DIContainer {
    static func resolve<T>() -> T
}

enum DefaultDIContainer: DIContainer {
    static func resolve<T>() -> T {
        
        switch "\(T.self)" {
            case "\(CleanUseCaseInteractor.self)":
                return DefaultCleanUseCaseInteractor(
                    presenter: DefaultCleanPresenter(),
                    repository: DefaultCleanRepository()
                ) as! T
            default:
                fatalError("Unregistered service")
        }
    }
}

enum MockDIContainer: DIContainer {
    static func resolve<T>() -> T {
        
        switch "\(T.self)" {
            case "\(CleanUseCaseInteractor.self)":
                return DefaultCleanUseCaseInteractor(
                    presenter: DefaultCleanPresenter(),
                    repository: DefaultCleanRepository()
                ) as! T
            default:
                fatalError("Unregistered service")
        }
    }
}



