//
//  CleanPresenter.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

protocol CleanPresenter: AnyObject {
    var delegate: CleanUseCaseOutputDelegate? { get set }
    func setLabel(response: String)
}

protocol CleanUseCaseOutputDelegate: AnyObject {
    func setLabel(response: String)
}

class DefaultCleanPresenter: CleanPresenter {
    weak var delegate:  CleanUseCaseOutputDelegate?
    
    func setLabel(response: String) {
        delegate?.setLabel(response: response)
    }
}
