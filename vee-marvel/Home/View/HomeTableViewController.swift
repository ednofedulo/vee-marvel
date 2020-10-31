//
//  HomeTableViewController.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 30/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var viewModel:HomeViewModel?
    
    init(viewModel:HomeViewModel) {
        self.viewModel = viewModel
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.didSelectRow(at: indexPath.row)
    }

}

extension HomeTableViewController: HomeViewModelViewDelegate {
    func didFetchDataFromAPISucces(sender: HomeViewModel) {
        
    }
    
    func didFetchDataFromAPIFail(sender: HomeViewModel) {
        
    }
}
