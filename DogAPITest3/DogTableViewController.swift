//
//  TableViewController.swift
//  DogAPITest3
//
//  Created by Yujia on 2022/2/6.
////  A00246407

import UIKit

class DogTableViewController: UITableViewController {
    
    var dog = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //set table row height
        self.tableView.rowHeight = 44.0
        //fetch dog list
        DogAPIHelper.fetchdog{newArray in
            self.dog = newArray
            self.tableView.reloadData()
       }
        
     }
      
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dog.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dog", for: indexPath) as!
        DogTableViewCell
        
        //set cell's label with dog breed
        cell.DogBreedName.text = dog[indexPath.row]
        
        //fetch dog name
        DogAPIHelper.fetchdog { newArray in
            let URL: String = "https://dog.ceo/api/breed/"
                let List = newArray[indexPath.row]
                let url: String = URL + List + "/images"
                //fetch dog image with dog breed
                DogAPIHelper.fetchImage(url: url ) {dogImage in
                    //load pause
                    for _ in 0...100000{
                        continue
                    }
                    do{
                        cell.spinner.isHidden = true
                        //transfer image url to UIImage and set cell's image
                        try
                        cell.DogBreedImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                    }catch let error{
                        print(error)
                    }
   
               }
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        //set cell as index
        let index = tableView.indexPathForSelectedRow!.row
        //set selected dog name value (string)
        let selectedDog = dog[index].self
        let dst = segue.destination as! DogBreedViewController
        //set dog breed view controller's variable dogName as selected dog name
        dst.dogName = selectedDog
    }
    
}
