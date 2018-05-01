//
//  BrowseViewController.swift
//  dscvr
//
//  Created by Jake Goodman on 4/21/18.
//  Copyright © 2018 Jake Martin. All rights reserved.
//

import UIKit
import Spartan

class BrowseViewController: UIViewController {
    
    fileprivate let searchBar: UISearchBar
    fileprivate let tableView: UITableView
    
    fileprivate var artists: [SimplifiedArtist]
    fileprivate enum Constants {
        static let featuredHeaderHeight: CGFloat = 50.0
        static let backgroundColor: UIColor = UIColor(r: 57, g: 84, b: 98, a: 1)
    }
    
    init() {
        searchBar = UISearchBar()
        tableView = UITableView()
        artists = []
        super.init(nibName: nil, bundle: nil)
       
        self.title = "Browse"
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = Constants.backgroundColor
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var timer: Timer?
}

extension BrowseViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        if let query = searchBar.text, !query.isEmpty {
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { (timer) in
                SpotifyManager.shared.search(for: searchBar.text!) { (artists) in
                    self.artists = artists
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        if SpotifyManager.shared.hasValidSession {
            return true
        }
        else {
            let spotifyAlertController = SpotifyAlertViewController()
            self.present(spotifyAlertController, animated: true, completion: nil)
            return false
        }
    }
}

extension BrowseViewController: UITableViewDelegate {
    
}

extension BrowseViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.artists[indexPath.row].name
        return cell
    }
}


