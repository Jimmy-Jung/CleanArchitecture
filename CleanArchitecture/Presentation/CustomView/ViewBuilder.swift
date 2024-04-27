//
//  ViewBuilder.swift
//  Tablet
//
//  Created by 정준영 on 4/23/24.
//

import UIKit
import SwiftUI

@resultBuilder
struct UIViewBuilder {
    static func buildBlock(_ components: UIView...) -> [UIView] {
        components
    }
    // 
    // static func buildBlock(_ components: any View...) -> [any View] {
    //     components
    // }
    
    static func buildBlock<Content>(_ content: Content) -> Content where Content : View {
        content
    }
}
