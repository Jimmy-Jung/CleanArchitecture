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
    
    private var TitleLabel: UILabel = UILabel()
    private var UpButton: UIButton = UIButton(configuration: .filled())
    private var DownButton: UIButton = UIButton(configuration: .filled())
    private let useCaseInterActor: CleanUseCaseInteractor
    
    init(useCaseInterActor: CleanUseCaseInteractor) {
        self.useCaseInterActor = useCaseInterActor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useCaseInterActor.presenter?.delegate = self
        view.body {
            VStack_JM(spacing: 20, alignment: .center) {
                TitleLabel
                    .text("Hello, World!")
                    .numberOfLines(1)
                    .lineBreakMode(.byClipping)
                    .font(.systemFont(ofSize: 20))
                    .textAlignment(.center)
                    .textColor(.label)
                
                HStack_JM(spacing: 10, alignment: .center) {
                    UpButton
                        .baseBackgroundColor(.systemBlue)
                        .baseForegroundColor(.white)
                        .title(" + ")
                        .addAction { [weak self] in
                            guard let self else { return }
                            useCaseInterActor.upButtonTapped()
                        }
                    
                    DownButton
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
}

extension CleanViewController: CleanUseCaseOutputDelegate {
    func setLabel(response: String) {
        TitleLabel.text(response)
    }
}


@available(iOS 17.0, *)
#Preview {
    DIContainer.makeViewController()
}
