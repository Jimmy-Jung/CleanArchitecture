//
//  ZStack_JM.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit

final class ZStack_JM: UIView {
    init(@ViewBuilder _ content: () -> [UIView]) {
        super.init(frame: .zero)
        content().forEach {
            self.addSubview($0)
            $0.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
