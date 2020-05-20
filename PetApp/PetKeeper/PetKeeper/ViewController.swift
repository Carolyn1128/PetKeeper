//
//  ViewController.swift
//  PetKeeper
//
//  Created by Carolyn Chen on 5/7/20.
//  Copyright © 2020 Carolyn Chen. All rights reserved.
//

import UIKit
import CoreData

class ViewController : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{

   
    let cellSpacingHeight: CGFloat = 10
    @IBOutlet weak var petImage: UIImageView!
    let img = UIImagePickerController()
    @IBOutlet weak var TimeLabel: UILabel!
    var myTimer : Timer!
    var sec = 0
    var min = 0
    @IBOutlet weak var foodBar: UIProgressView!
    @IBOutlet weak var waterBar: UIProgressView!
    
    @IBAction func resetWater(_ sender: Any) {
        waterBar.progress = 1
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true){(timer) in
         if self.waterBar.progress == 0.0{
            timer.invalidate()
            return
        }
            
            self.waterBar.progress -= 0.1
            self.waterBar.setProgress(self.waterBar.progress, animated: true)
        }
    }
    @IBAction func resetFood(_ sender: Any) {
        foodBar.progress = 1
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true){(timer) in
            if self.foodBar.progress == 0.0{
                   timer.invalidate()
                   return
               }
                   
            self.foodBar.progress -= 0.1
            self.foodBar.setProgress(self.foodBar.progress, animated: true)
               }
    }
    @IBAction func ResetTimer(_ sender: Any) {
        sec = 0
        min = 0
        updateLabel()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        img.delegate = self
        
        self.myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
        
            
        }
        
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    
    @objc func updateLabel(){
        sec+=1
        if sec == 60{
            sec = 0
            min += 1
        }

        self.TimeLabel.text = String(min)+":"+String(sec)
    }
    
    @IBAction func importImage (_sender: UIButton){
        img.sourceType = .photoLibrary
        img.allowsEditing = true
        present(img,animated: true, completion: nil)
        
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage{
            petImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    

    
    
    
    
    
   
   
    // MARK: - Table view data source

    
   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
