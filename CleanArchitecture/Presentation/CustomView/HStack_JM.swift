//
//  HStack_JM.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit

final class HStack_JM: UIStackView {
    init() {
        super.init(frame: .zero)
        self.axis(.horizontal)
            .alignment(.center)
            .distribution(.fill)
    }
    
    convenience init(
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView]
    ) {
        self.init()
        self.alignment(alignment)
            .distribution(distribution)
            .spacing(spacing)
        
        content().forEach { self.addArrangedSubview($0) }
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
