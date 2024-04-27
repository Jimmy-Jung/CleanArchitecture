//
//  UIButton +.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit

extension UIButton {
    open override func sendAction(_ action: UIAction) {
        print("Button Tapped")
        super.sendAction(action)
    }
}
