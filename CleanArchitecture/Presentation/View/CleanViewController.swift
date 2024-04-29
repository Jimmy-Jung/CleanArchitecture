//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by 정준영 on 4/27/24.
//

import UIKit
import JimmyKit
import SnapKit
import Combine

struct SampleData {
    var titleText: String
    var width: CGFloat = 0
    var textColor: UIColor = .label
    
    init(titleText: String) {
        self.titleText = titleText
    }
}

protocol CleanViewDelegate: AnyObject {
    func buttonTapped(isPlus: Bool)
}

final class CleanViewController: UIViewController {
    private let useCaseInterActor: CleanUseCaseInteractor
    init(useCaseInterActor: CleanUseCaseInteractor) {
        self.useCaseInterActor = useCaseInterActor
        super.init(nibName: nil, bundle: nil)
    }
    var sampleData: SampleData? = .init(titleText: "Hello world") {
        didSet {
            cleanView.sampleData = sampleData
        }
    }
    var cleanView: CleanView = CleanView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        useCaseInterActor.presenter?.delegate = self
        view.body(cleanView)
        cleanView.delegate = self
        cleanView.sampleData = sampleData
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CleanViewController: CleanUseCaseOutputDelegate, CleanViewDelegate {
    func buttonTapped(isPlus: Bool) {
        if isPlus {
            useCaseInterActor.downButtonTapped()
        } else {
            useCaseInterActor.upButtonTapped()
        }
    }
    
    func setLabel(response: String) {
        print(response)
        if response == "서버에서 받아온 -" {
            sampleData?.width = 50
            sampleData?.textColor = .red
        } else {
           sampleData?.width = 100
              sampleData?.textColor = .blue
        }
        sampleData?.titleText = response
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
