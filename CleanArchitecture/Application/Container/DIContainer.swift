//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

@propertyWrapper
struct Dependancy<T> {
    var wrappedValue: T
    init() {
        #if DEBUG
        self.wrappedValue = MockDIContainer.resolve()
        #else
        self.wrappedValue = DefaultDIContainer.resolve()
        #endif
    }
}

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



