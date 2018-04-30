//
//  SpotifyAlertViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/29/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit

class SpotifyAlertViewController: UIViewController {
    
    fileprivate enum Constants {
        static let contentViewBackgroundColor: UIColor = UIColor(red: 0.84, green: 0.87, blue: 0.90, alpha: 1.0)
        static let contentViewInsets: UIEdgeInsets = UIEdgeInsetsMake(0, 40.0, 0, 40.0)
        static let contentViewHeight: CGFloat = 180.0
        
        static let spotifyButtonInsets: UIEdgeInsets = UIEdgeInsetsMake(0, 40.0, 60.0, 40.0)
        static let spotifyButtonColor: UIColor = UIColor(red:0.11, green:0.73, blue:0.33, alpha:1.0)
        
    }
    
    let contentView: UIView
    let spotifyButton: UIButton
    let skipButton: UIButton
    
    init() {
        contentView = UIView()
        spotifyButton = UIButton()
        skipButton = UIButton()
        
        super.init(nibName: nil, bundle: nil)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        spotifyButton.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonStackView = UIStackView(arrangedSubviews: [spotifyButton, skipButton])
        buttonStackView.axis = .vertical
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentView)
        contentView.addSubview(buttonStackView)
        
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.contentViewInsets.left).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.contentViewInsets.right).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: Constants.contentViewHeight).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.spotifyButtonInsets.bottom).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.spotifyButtonInsets.left).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.spotifyButtonInsets.right).isActive = true

        setupViews()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SpotifyManager.shared.hasValidSession {
            hide()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        contentView.backgroundColor = Constants.contentViewBackgroundColor
        
        spotifyButton.backgroundColor = Constants.spotifyButtonColor
        spotifyButton.setTitle("Connect", for: .normal)
        spotifyButton.addTarget(self, action: #selector(startAuthorizationFlow), for: .touchUpInside)
        
        skipButton.setTitle("Later", for: .normal)
        skipButton.addTarget(self, action: #selector(hide), for: .touchUpInside)

        modalPresentationStyle = .overCurrentContext
    }
    
    @objc
    func startAuthorizationFlow() {
        SpotifyManager.shared.startAuthorizationFlow(on: self)
    }
    
    @objc
    func hide() {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
