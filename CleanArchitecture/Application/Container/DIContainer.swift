//
//  DIContainer.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

enum DIContainer {
    static func makeViewController() -> CleanViewController {
        let interactor = DefaultCleanUseCaseInteractor(
            presenter: DefaultCleanPresenter(),
            repository: DefaultCleanRepository()
        )
        return CleanViewController(useCaseInterActor: interactor)
    }
    
    static func makeSwiftUICopyViewController() -> SwiftUICopyViewController {
        let interactor = DefaultCleanUseCaseInteractor(
            presenter: DefaultCleanPresenter(),
            repository: DefaultCleanRepository()
        )
        return SwiftUICopyViewController(useCaseInterActor: interactor)
    }
}
