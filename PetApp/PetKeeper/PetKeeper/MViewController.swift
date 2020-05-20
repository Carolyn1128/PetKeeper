//
//  MViewController.swift
//  PetKeeper
//
//  Created by Carolyn Chen on 5/8/20.
//  Copyright © 2020 Carolyn Chen. All rights reserved.
//

import UIKit
import CoreData

class MViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var MLists:UITableView!
    var tableListM = [Medicines]()
     
       let cellSpacingHeight: CGFloat = 10
       
       
       override func viewDidLoad() {
           super.viewDidLoad()

           MLists.tableFooterView =  UIView.init(frame: .zero)
           MLists.dataSource = self
           MLists.delegate = self

           let fR2:NSFetchRequest<Medicines> = Medicines.fetchRequest()
           
           
           do{
               let tableListM = try PersistenceServce.context.fetch(fR2)
               self.tableListM = tableListM
               self.MLists.reloadData()
                  }catch{}
           // Uncomment the following line to preserve selection between presentations
           // self.clearsSelectionOnViewWillAppear = false

           // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
           // self.navigationItem.rightBarButtonItem = self.editButtonItem
       }
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return self.tableListM.count
         }

       
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
           cell.textLabel?.text = tableListM[indexPath.row].name
           cell.detailTextLabel?.text = tableListM[indexPath.row].date
           cell.textLabel?.font = UIFont(name: "Noteworthy", size: 27.0)
           cell.detailTextLabel?.font = UIFont(name: "Noteworthy", size: 22.0)
           cell.layer.borderWidth = 3
           cell.layer.cornerRadius = 0
           cell.clipsToBounds = true
           let color = UIColor(red: 0.96, green: 0.62, blue: 0.29, alpha: 1.00)
           cell.backgroundColor = color
           return cell
       }
       func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }

       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return cellSpacingHeight
       }
    
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete{
               PersistenceServce.context.delete(tableListM[indexPath.row])
               tableListM.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .bottom)
               
               
           }
       }
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100.0
       }
       
     
       @IBAction func newMedicine(_ sender:UIButton){
           let msg = UIAlertController(title: "New Medicine", message: nil, preferredStyle: .alert)
                    msg.addTextField{(textField) in
                       textField.placeholder = "Medicine Name"
                    }
                    msg.addTextField{(textField) in
                      textField.placeholder = "Date"
                    }
                
                         let submit = UIAlertAction(title: "Sumbit", style: .default) { (action)->Void in
                                 //self.tableListA.insert(input!, at: 0)
                                // self.ALists.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
                              let name = msg.textFields!.first!.text!
                              let date = msg.textFields!.last!.text!
                              let Medicine = Medicines(context: PersistenceServce.context)
                           Medicine.name = name
                           Medicine.date = date
                           PersistenceServce.saveContext()
                           self.tableListM.append(Medicine)
                           self.MLists.reloadData()
                          
                             
                         }
                         let cancel = UIAlertAction(title:"Cancel", style: .cancel){
                             (action) -> Void in
                          
                             
                         }
                         
                         msg.addAction(submit)
                         msg.addAction(cancel)
                      
                         self.present(msg, animated: true, completion: nil)
       }
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
