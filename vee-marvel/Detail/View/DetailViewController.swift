//
//  DetailViewController.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var viewModel: DetailViewModel?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: DetailViewModelViewDelegate {
    func didFetchDataSuccess(sender: DetailViewModel) {
        
    }
    
    func didFetchDataFail(sender: DetailViewModel) {
        
    }
    
    
}
