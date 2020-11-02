//
//  ViewController.swift
//  SearchFlickerDemo
//
//  Created by 江柏毅 on 2020/11/1.
//

import UIKit
import Foundation

class PhotoViewController: UICollectionViewController {
    
    var photos = [Item]()
    
    
    func fetchData() {
        
        if let url = URL(string: "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let feedData = try? JSONDecoder().decode(FeedData.self, from: data) {
                    self.photos = feedData.items
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            }
            
            task.resume()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       

        
        
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (view.bounds.width - 100) / 2
        layout?.itemSize = CGSize(width: width, height: width + 80)
        fetchData()
    }
    
   // override func numberOfSections(in collectionView: UICollectionView) -> Int {
    //return 2
    //}
    


    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! PhotoCollectionViewCell
        
        // Configure the cell
        let photo = photos[indexPath.item]
        
        
        cell.titleLabel.text = photo.title
        cell.imageURL = photo.media.m
        cell.photoImageView.image = nil

        NetworkUtility.downloadImage(url: cell.imageURL) { (image) in
            if cell.imageURL == photo.media.m, let image = image  {
                DispatchQueue.main.async {
                    cell.photoImageView.image = image
                }
            }
        }


        return cell
    }
    


}

