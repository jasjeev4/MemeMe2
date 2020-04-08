//
//  File.swift
//  ImagePicker
//
//  Created by JASJEEV on 4/7/20.
//  Copyright © 2020 Lorgarithmic Science. All rights reserved.
//

import UIKit



class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configureUI(meme: Meme) {
        imageView.image = meme.memedImage
    }
}
