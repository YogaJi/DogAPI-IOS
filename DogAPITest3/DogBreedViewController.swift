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
    //set dog image, breed name, and spinner
    @IBOutlet weak var dogMainImage: UIImageView!
    @IBOutlet weak var dogBreed: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spinner:
        spinner.startAnimating()
        //receive dog breed name from tableview
        dogBreed.text = dogName
        let url: String = URL + dogName + "/images"
        //fetch dog image by dog breed name
            DogAPIHelper.fetchImage(url: url ) {dogImage in
                //pause
                for _ in 0...1000000{
                    continue
                }
                do{
                    try
                    //set image the first json image url and transfer it to UIImage
                    self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                    self.spinner.isHidden = true
                }catch let error{
                    print(error)
                }
          }
    }
    @IBAction func NewDogImageButton(_ sender: Any) {
        let url: String = URL + dogName + "/images"
            //fetch dog image by dog breed name
            DogAPIHelper.fetchImage(url: url ) {dogImage in
                //pause
                for _ in 0...1000000{
                    continue
                }
                         
                do{
                try
                    //set image in the random json image url and transfer it to UIImage
                   self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage.randomElement()!)! as URL) as Data)
  
               }catch let error{
                   print(error)
               }
          }
    }


}
