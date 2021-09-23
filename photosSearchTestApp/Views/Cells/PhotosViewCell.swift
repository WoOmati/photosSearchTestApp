//
//  PhotosViewCell.swift
//  photosSearchTestApp
//
//  Created by macbook on 20.09.2021.
//

import UIKit

class PhotosViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFill

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
