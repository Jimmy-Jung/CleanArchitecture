//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit
import JimmyKit
import SnapKit
import Then

final class CleanViewController: UIViewController {
    private let useCaseInterActor: CleanUseCaseInteractor
    
    init(useCaseInterActor: CleanUseCaseInteractor) {
        self.useCaseInterActor = useCaseInterActor
        super.init(nibName: nil, bundle: nil)
    }
    
    @Observable var titleText: String = "Hello World"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useCaseInterActor.presenter?.delegate = self

        view.body {
            VStack_JM(spacing: 20, alignment: .center) {
                CustomLabel()
                    .text(_titleText)
                    .numberOfLines(1)
                    .lineBreakMode(.byClipping)
                    .font(.systemFont(ofSize: 20))
                    .textAlignment(.center)
                    .textColor(.label)
                
                HStack_JM(spacing: 10, alignment: .center) {
                    UIButton(configuration: .filled())
                        .baseBackgroundColor(.systemBlue)
                        .baseForegroundColor(.white)
                        .title(" + ")
                        .addAction { [weak self] in
                            guard let self else { return }
                            useCaseInterActor.upButtonTapped()
                        }
                    
                    UIButton(configuration: .filled())
                        .baseBackgroundColor(.systemBlue)
                        .baseForegroundColor(.white)
                        .title(" - ")
                        .addAction { [weak self] in
                            guard let self else { return }
                            useCaseInterActor.downButtonTapped()
                        }
                }
                
            }
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CleanViewController: CleanUseCaseOutputDelegate {
    func setLabel(response: String) {
        print(response)
        if response == "서버에서 받아온 -" {
            changeRootViewController()
        }
        titleText = response
    }
    
    func changeRootViewController() {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemRed
        UIApplication.shared.windows.first?.rootViewController = vc
    }
}


@available(iOS 17.0, *)
#Preview {
    DIContainer.makeViewController()
}
