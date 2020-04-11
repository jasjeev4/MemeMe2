//
//  TableViewController.swift
//  ImagePicker
//
//  Created by JASJEEV on 4/6/20.
//  Copyright © 2020 Lorgarithmic Science. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //Refresh table contents on view load
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText + " ... " + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memeDetailViewController = self.storyboard?.instantiateViewController(withIdentifier:
            "MemeDetailView") as! MemeDetailView
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        memeDetailViewController.memedImage = appDelegate.memes[indexPath.row].memedImage
        navigationController?.pushViewController(memeDetailViewController, animated: true)
    }
    
}
