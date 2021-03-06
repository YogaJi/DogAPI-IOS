//
//  DogTableViewCell.swift
//  DogAPITest3
//
//  Created by Yujia on 2022/3/8.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    //set tableview cell label, image and spinner
    @IBOutlet weak var DogBreedName: UILabel!
    @IBOutlet weak var DogBreedImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //set spinner animation
        spinner.startAnimating()
        // Configure the view for the selected state
    }

}
