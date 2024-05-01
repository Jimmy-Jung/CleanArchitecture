//
//  Dependency.swift
//  CleanArchitecture
//
//  Created by 정준영 on 5/1/24.
//

import Foundation

@propertyWrapper
struct Dependency<T> {
    var wrappedValue: T
    init() {
        #if DEBUG
        self.wrappedValue = MockDIContainer.resolve()
        #else
        self.wrappedValue = DefaultDIContainer.resolve()
        #endif
    }
}
