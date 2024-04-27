//
//  Spacer_JM.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit

final class Spacer_JM: UIView {
    
    init() {
        super.init(frame: .zero)
    }
    
    init(vertical: CGFloat) {
        super.init(frame: .zero)
        self.snp.makeConstraints { make in
            make.height.equalTo(vertical)
        }
    }
    
    init(horizontal: CGFloat) {
        super.init(frame: .zero)
        self.snp.makeConstraints { make in
            make.width.equalTo(horizontal)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
