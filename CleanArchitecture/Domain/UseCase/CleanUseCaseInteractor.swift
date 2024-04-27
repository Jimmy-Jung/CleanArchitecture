//
//  CleanUseCaseInput.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

protocol CleanUseCaseInput {
    func upButtonTapped()
    func downButtonTapped()
}

protocol CleanUseCaseInteractor: CleanUseCaseInput {
    var presenter: CleanPresenter? { get }
    var repository: CleanRepository { get }
    init(presenter: CleanPresenter, repository: CleanRepository)
}

class DefaultCleanUseCaseInteractor: CleanUseCaseInteractor {
    
    var presenter: CleanPresenter?
    var repository: CleanRepository
    
    required init(
        presenter: CleanPresenter,
        repository: CleanRepository
    ) {
        self.presenter = presenter
        self.repository = repository
    }
    
    func upButtonTapped() {
        let response = repository.fetch(target: .getPlus)
        presenter?.setLabel(response: response)
    }
    
    func downButtonTapped() {
        let response = repository.fetch(target: .getMinus)
        presenter?.setLabel(response: response)
    }
 
}
