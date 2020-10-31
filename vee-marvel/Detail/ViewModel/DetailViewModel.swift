//
//  DetailViewModel.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import Foundation

protocol DetailViewModelViewDelegate: AnyObject {
    func didFetchDataSuccess(sender: DetailViewModel)
    func didFetchDataFail(sender: DetailViewModel)
}

struct DetailViewModel {
    
    weak var delegate: DetailViewModelViewDelegate?
    
}
