//
//  UIView+.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit
import SwiftUI
import SnapKit

protocol Stylable {}
extension UIView: Stylable {
    @frozen enum Alignment {
        case center
        case leading
        case trailing
        case top
        case bottom
        case fill
        case edges
        case firstBaseline
        case lastBaseline
    }
}

extension Stylable where Self: UIView {
    
    init(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView] = { [] }
    ) {
        self.init(frame: .zero)
        addVStackView(
            alignment: alignment,
            distribution: distribution,
            content
        )
    }
    
    @discardableResult
    func body(_ view: UIView) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return self
    }
    
    @discardableResult
    func body(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView] = { [] }
    ) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        addVStackView(
            alignment: alignment,
            distribution: distribution,
            content
        )
        return self
    }
    
    @discardableResult
    func body(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @ViewBuilder _ content: () -> some View
    ) -> Self {
        self.subviews.forEach { $0.removeFromSuperview() }
        if let hostView = UIHostingController(rootView: content()).view {
            addVStackView(alignment: alignment, distribution: distribution) {
                hostView
            }
        }
        return self
    }
    
    fileprivate func addVStackView(
        alignment: Alignment = .center,
        distribution: UIStackView.Distribution = .fill,
        @UIViewBuilder _ content: () -> [UIView]
    ) {
        let vStackView = VStack_JM(distribution: distribution, content)
        self.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            switch alignment {
                case .center:
                    make.center.equalToSuperview()
                case .fill:
                    make.horizontalEdges.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .edges:
                    make.edges.equalToSuperview()
                case .leading:
                    make.leading.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .trailing:
                    make.trailing.equalToSuperview()
                    make.centerY.equalToSuperview()
                case .top:
                    make.top.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .bottom:
                    make.bottom.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .firstBaseline:
                    make.firstBaseline.equalToSuperview()
                    make.centerX.equalToSuperview()
                case .lastBaseline:
                    make.lastBaseline.equalToSuperview()
                    make.centerX.equalToSuperview()
            }
        }
    }
    
    @discardableResult
    func frame(
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) -> Self {
        if let width {
            if let vStackView = self.subviews.first as? VStack_JM {
                vStackView.snp.makeConstraints { make in
                    make.width.equalTo(width)
                }
            }
        }
        if let height {
            if let vStackView = self.subviews.first as? VStack_JM {
                vStackView.snp.makeConstraints { make in
                    make.height.equalTo(height)
                }
            }
        }
        return self
    }
}
