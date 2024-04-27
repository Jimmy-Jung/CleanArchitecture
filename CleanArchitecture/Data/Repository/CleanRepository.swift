//
//  CleanRepository.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import Foundation

protocol CleanRepository {
    func fetch(target: CleanAPIService) -> String
}

class DefaultCleanRepository: CleanRepository {
    func fetch(target: CleanAPIService) -> String {
        target.value
    }
}
