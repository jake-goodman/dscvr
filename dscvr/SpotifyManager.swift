//
//  SpotifyManager.swift
//  dscvr
//
//  Created by Jake Goodman on 4/29/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import Foundation
import SafariServices

class SpotifyManager {

    fileprivate enum Constants {
        static let clientID: String = /* INSERT SPOTIFY CLIENT HERE*/
        static let redirectURL: String = "dscvr://auth-redirect"
        static let sessionKey: String = "spotify-session"
    }
    
    static let shared: SpotifyManager = SpotifyManager()
    fileprivate let authManager = SPTAuth.defaultInstance()
    fileprivate var authenticationViewController: UIViewController?
    
    public var hasValidSession: Bool {
        return authManager?.session?.isValid() == true
    }
    
    private init() {}
    
    public func initialize() {
        authManager?.clientID = Constants.clientID
        authManager?.redirectURL = URL(string: Constants.redirectURL)
        authManager?.sessionUserDefaultsKey = Constants.sessionKey
        authManager?.requestedScopes = [SPTAuthStreamingScope]
    }
    
    public func startAuthorizationFlow(on viewController: UIViewController){
        if hasValidSession {
            //Login with authManager.session.accessToken
        }
        else if let authURL = self.authManager?.spotifyWebAuthenticationURL() {
            let authViewController = SFSafariViewController(url: authURL)
            authenticationViewController = authViewController
            viewController.present(authViewController, animated: true, completion: nil)
        }
    }
    
    public func willHandleAuthorization(url: URL)->Bool {
        guard let authManager = authManager else { return false }
        if authManager.canHandle(url) {
            authManager.handleAuthCallback(withTriggeredAuthURL: url) { (error, session) in
                if error != nil {
                    print("*** Spotify Auth error: \(error?.localizedDescription ?? "unknown" )")
                }
                else {
                    if session != nil {
                        authManager.session = session
                        self.authenticationViewController?.dismiss(animated: true, completion: nil)
                    }
                }
            }
            return true
        }
        return false
    }
}
