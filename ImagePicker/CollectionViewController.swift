//
//  CollectionViewController.swift
//  ImagePicker
//
//  Created by JASJEEV on 4/6/20.
//  Copyright © 2020 Lorgarithmic Science. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
        
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        
        // Set dimensions
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 2.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refresh collection on View reload
        collectionView.reloadData()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        
        // Set up reusable cell

        let memeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        
        memeCollectionViewCell.configureUI(meme: appDelegate.memes[indexPath.item])
        
        return memeCollectionViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailView") as! MemeDetailView
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        
        memeDetailViewController.memedImage = appDelegate.memes[indexPath.item].memedImage
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
}
