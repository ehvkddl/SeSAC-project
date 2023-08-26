//
//  OnboardingContentViewController.swift
//  TMDB
//
//  Created by do hee kim on 2023/08/27.
//

import UIKit
import SnapKit
import Lottie

class OnboardingContentViewController: UIViewController {

    let stackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 20
        
        return view
    }()

    lazy var animationView = {
        let view = LottieAnimationView(name: animationName)
        
        view.loopMode = .repeat(3)
        view.play()
        
        return view
    }()
    lazy var titleLabel = {
        let lbl = UILabel()
        
        lbl.text = titleText
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        lbl.numberOfLines = 0

        return lbl
    }()
    lazy var subtitleLabel = {
        let lbl = UILabel()
        
        lbl.text = subtitleText
        lbl.textAlignment = .center
        lbl.numberOfLines = 0

        return lbl
    }()
    
    var animationName: String
    var titleText: String
    var subtitleText: String
    
    init(animationName: String, titleText: String, subtitleText: String) {
        self.animationName = animationName
        self.titleText = titleText
        self.subtitleText = subtitleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setConstraints()
    }

}

extension OnboardingContentViewController {
    
    func setConstraints() {
        [animationView, titleLabel, subtitleLabel].forEach { stackView.addArrangedSubview($0) }

        view.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.horizontalEdges.equalTo(view).inset(26)
            make.height.equalTo(UIScreen.main.bounds.height * 0.5)
        }
        
        animationView.snp.makeConstraints { make in
            make.size.equalTo(UIScreen.main.bounds.width * 0.8)
        }
        
    }
    
}