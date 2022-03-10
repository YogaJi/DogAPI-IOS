//
//  DogBreedViewController.swift
//  DogAPITest3
//
//  Created by Yujia on 2022/3/8.
//

import UIKit

class DogBreedViewController: UIViewController {
    var dogName: String!
    let URL: String = "https://dog.ceo/api/breed/"
    @IBOutlet weak var dogMainImage: UIImageView!
    @IBOutlet weak var showURL: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showURL.text = dogName
        let url: String = URL + dogName + "/images"
            DogAPIHelper.fetchImage(url: url ) {dogImage in
                do{
                    try
                    self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                    print(dogImage[0])
                }catch let error{
                    print(error)
                }
          }
    }
    @IBAction func NewDogImageButton(_ sender: Any) {
        let url: String = URL + dogName + "/images"
            DogAPIHelper.fetchImage(url: url ) {dogImage in
                do{
                    try
                    self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage.randomElement()!)! as URL) as Data)
                }catch let error{
                    print(error)
                }
          }
    }


}
