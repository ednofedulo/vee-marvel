//
//  DetailViewController.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 31/10/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    var viewModel: DetailViewModel?
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel?.fetchComics()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        self.title = self.viewModel?.character.name
        
        if let description = self.viewModel?.character.description, description.isEmpty == false {
            self.descriptionLabel.text = self.viewModel?.character.description
        }
        
        self.image.kf.indicatorType = .activity
        self.image.kf.setImage(with: self.viewModel?.character.thumbnail?.urllandscape)
        
        self.comicsCollectionView.dataSource = self
        self.comicsCollectionView.delegate = self
        registerNibComic()
    }
    
    func registerNibComic() {
        let nib = UINib(nibName: "ComicCollectionViewCell", bundle: nil)
        comicsCollectionView?.register(nib, forCellWithReuseIdentifier: "comicCell")
        if let flowLayout = self.comicsCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
}

extension DetailViewController: DetailViewModelViewDelegate {
    func didFetchDataSuccess(sender: DetailViewModel) {
        comicsCollectionView.reloadData()
        
    }
    
    func didFetchDataFail(sender: DetailViewModel) {
        let alert = UIAlertController(title: "Error", message: "Ocorreu um problema ao obter as informações.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.comics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "comicCell", for: indexPath) as? ComicCollectionViewCell {
            guard let comic = self.viewModel?.comics?[indexPath.row] else { return UICollectionViewCell() }
            cell.setup(comic: comic)
            return cell
            
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 200)
    }
}
