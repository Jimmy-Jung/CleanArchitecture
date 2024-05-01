//
//  CleanView.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/29/24.
//

import UIKit
import SwiftUI

final class CleanView: UIView {
    weak var delegate: CleanViewDelegate?
    let TitleLabel = UILabel()
    var sampleData: SampleData? {
        didSet {
            setNeedsLayout()
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                options: [.beginFromCurrentState],
                animations: {
                    self.TitleLabel.layoutIfNeeded()
                    
                },
                completion: nil
            )
        }
    }

    init() {
        super.init(frame: .zero)
        self.body {
            VStack_JM(spacing: 20, alignment: .center) {
                TitleLabel
                    .numberOfLines(1)
                    .lineBreakMode(.byClipping)
                    .font(.systemFont(ofSize: 20))
                    .textAlignment(.center)
                
                HStack_JM(spacing: 10, alignment: .center) {
                    UIButton(configuration: .filled())
                        .baseBackgroundColor(.systemBlue)
                        .baseForegroundColor(.white)
                        .title(" + ")
                        .addAction { [weak self] in
                            guard let self else { return }
                            delegate?.buttonTapped(isPlus: true)
                        }
                    
                    UIButton(configuration: .filled())
                        .baseBackgroundColor(.systemBlue)
                        .baseForegroundColor(.white)
                        .title(" - ")
                        .addAction { [weak self] in
                            guard let self else { return }
                            delegate?.buttonTapped(isPlus: false)
                        }
                }
                
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        TitleLabel
            .text(sampleData?.titleText)
            .textColor(sampleData?.textColor ?? .brown)
            
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 17.0, *)
#Preview {
    CleanViewController()
}
