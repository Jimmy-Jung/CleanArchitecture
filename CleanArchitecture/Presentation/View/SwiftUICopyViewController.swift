//
//  SwiftUICopyViewController.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit
import SwiftUI

class Value: ObservableObject {
    @Published var value: String = ""
    
    init(_ value: String) {
        self.value = value
    }
    
    func increase() {
        if var intValue = Int(value) {
            intValue += 1
            value = String(intValue)
        } else {
            value = "1"
        }
    }
    
    func decrease() {
        if var intValue = Int(value) {
            intValue -= 1
            value = String(intValue)
        } else {
            value = "0"
        }
    }
}

final class SwiftUICopyViewController: UIViewController {
        
    private let useCaseInterActor: CleanUseCaseInteractor
    
    @StateObject var value: Value = Value("Hello World")
    
    init(useCaseInterActor: CleanUseCaseInteractor) {
        self.useCaseInterActor = useCaseInterActor
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useCaseInterActor.presenter?.delegate = self
        view.body {
            VStack {
                Text(value.value)
                    .font(.system(size: 20))
                    .foregroundColor(Color(.label))
                
                HStack(alignment: .center) {
                    Button(action: { [weak self] in
                        guard let self else { return }
                        value.increase()
                    }, label: {
                        Text("+")                           .foregroundColor(.white)
                            .frame(width: 50, height: 30)
                    })
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 10))
                    
                    Button(action: { [weak self] in
                        guard let self else { return }
                        value.decrease()
                    }) {
                        Text("-")
                            .foregroundColor(.white)
                            .frame(width: 50, height: 30)
                    }
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 10))
                }
            }
            
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SwiftUICopyViewController: CleanUseCaseOutputDelegate {
    func setLabel(response: String) {
    }
}


@available(iOS 17.0, *)
#Preview {
    DIContainer.makeSwiftUICopyViewController()
}
