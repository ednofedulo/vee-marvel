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
        self.viewModel?.fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Characters"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.characters?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        let character = self.viewModel?.getCharacter(for: indexPath.row)
        
        let time = UILabel(frame: CGRect(x: 5, y: 5, width: 75, height: 20))
        time.text = character?.formattedModifiedDate
        time.font = UIFont.preferredFont(forTextStyle: .footnote)
        cell.accessoryView = time;
        
        cell.accessoryType = .disclosureIndicator
        
        cell.detailTextLabel?.text = character?.description
        cell.detailTextLabel?.numberOfLines = 2
        
        cell.textLabel?.text = character?.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.viewModel?.characters?.count {
            self.viewModel?.fetchData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.didSelectRow(at: indexPath.row)
    }
    
}

extension HomeTableViewController: HomeViewModelViewDelegate {
    func didFetchDataFromAPISuccess(sender: HomeViewModel) {
        self.tableView.reloadData()
    }
    
    func didFetchDataFromAPIFail(sender: HomeViewModel) {
        let alert = UIAlertController(title: "Error", message: "Ocorreu um problema ao obter as informações.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
