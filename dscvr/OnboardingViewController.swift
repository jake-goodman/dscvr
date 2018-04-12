//
//  OnboardingViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/11/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    var backgroundImageView: UIImageView
    var titleLabel: UILabel
    var signInButton: UIButton
    var createAccountButton: UIButton
    
    fileprivate enum Constants {
        static let buttonSize: CGSize = CGSize(width: 220, height: 44)
        static let titlePadding: UIEdgeInsets = UIEdgeInsets(top: 180.0, left: 0, bottom: 0, right: 0 )
    }
    
    init() {
        backgroundImageView = UIImageView()
        titleLabel = UILabel()
        signInButton = UIButton()
        createAccountButton = UIButton()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let buttonStackView = UIStackView(arrangedSubviews: [createAccountButton, signInButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 16
        
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(buttonStackView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.titlePadding.top).isActive = true
        
        signInButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height).isActive = true
    
        createAccountButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize.width).isActive = true
        createAccountButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize.height).isActive = true
        
        buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60.0).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        setupViews()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupViews(){
        backgroundImageView.image = UIImage(named: "background")
        
        titleLabel.text = "dscvr."
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 60.0)
        
        signInButton.setTitle("Log In", for: .normal)
        signInButton.showBorder(width: 2.0, color: UIColor(red: 1, green: 1, blue: 1, alpha: 1.0))
        signInButton.showRoundedCorners(show: true, cornerRadius: 18.0)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)

        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(.black, for: .normal)
        createAccountButton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        createAccountButton.showRoundedCorners(show: true, cornerRadius: 18.0)
        createAccountButton.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)

    }
    
    
    @objc func didTapCreate() {
        
    }
    
    @objc func didTapSignIn() {
        
    }
}

