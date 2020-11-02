//
//  PhotoImageView.swift
//  SearchFlickerDemo
//
//  Created by 江柏毅 on 2020/11/1.
//

import Foundation
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var imageURL: URL!
}
