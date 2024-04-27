//
//  ViewBuilder.swift
//  Tablet
//
//  Created by 정준영 on 4/23/24.
//

import UIKit

@resultBuilder
struct ViewBuilder {
    static func buildBlock(_ components: UIView...) -> [UIView] {
        components
    }
}
