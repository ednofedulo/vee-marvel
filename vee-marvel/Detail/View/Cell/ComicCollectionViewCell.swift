//
//  ComicCollectionViewCell.swift
//  vee-marvel
//
//  Created by Edno Fedulo on 01/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit
import Kingfisher

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(comic: Comic){
        label.text = comic.title
        image.kf.indicatorType = .activity
        image.kf.setImage(with: comic.thumbnail.urlportrait)
    }

}
