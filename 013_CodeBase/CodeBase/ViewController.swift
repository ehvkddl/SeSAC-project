//
//  ViewController.swift
//  CodeBase
//
//  Created by do hee kim on 2023/08/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let example1Button = {
        let button = UIButton()
        
        button.setTitle("example 1", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    let example2Button = {
        let button = UIButton()
        
        button.setTitle("example 2", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    let example3Button = {
        let button = UIButton()
        
        button.setTitle("example 3", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    @objc
    func example1ButtonCllicked() {
        let vc = Example1ViewController()
        
        present(vc, animated: true)
    }
    
    @objc
    func example2ButtonCllicked() {
        let vc = Example2ViewController()
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    @objc
    func example3ButtonCllicked() {
        let vc = Example3ViewController()
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }

}

extension ViewController {
    
    func configureUI() {
        [example1Button, example2Button, example3Button].forEach { view.addSubview($0) }
        
        
        // MARK: SnapKit
        example1Button.addTarget(self, action: #selector(example1ButtonCllicked), for: .touchUpInside)
        
        example1Button.snp.makeConstraints { make in
            make.bottom.equalTo(example2Button.snp.top).offset(-80)
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(80)
        }

        
        // MARK: NSLayoutConstraints
        example2Button.translatesAutoresizingMaskIntoConstraints = false
        
        example2Button.addTarget(self, action: #selector(example2ButtonCllicked), for: .touchUpInside)
        
        NSLayoutConstraint(item: example2Button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: example2Button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: example2Button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 200).isActive = true
        NSLayoutConstraint(item: example2Button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 80).isActive = true
        
        
        // MARK: NSLayoutAnchor
        example3Button.translatesAutoresizingMaskIntoConstraints = false
        
        example3Button.addTarget(self, action: #selector(example3ButtonCllicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            example3Button.topAnchor.constraint(equalTo: example2Button.bottomAnchor, constant: 80),
            example3Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            example3Button.widthAnchor.constraint(equalToConstant: 200),
            example3Button.heightAnchor.constraint(equalToConstant: 80),
        ])
        
    }
    
}
