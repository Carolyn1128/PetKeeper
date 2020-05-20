//
//  AViewController.swift
//  PetKeeper
//
//  Created by Carolyn Chen on 5/11/20.
//  Copyright © 2020 Carolyn Chen. All rights reserved.
//

import UIKit
import CoreData

class AViewController:UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    @IBOutlet weak var ALists:UITableView!
      var tableListA = [Appointments]()
      let cellSpacingHeight: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

          ALists.tableFooterView =  UIView.init(frame: .zero)
          ALists.dataSource = self
          ALists.delegate = self
          
        
          
          let fR:NSFetchRequest <Appointments> = Appointments.fetchRequest()
          
          
          do{
              let tableListA = try PersistenceServce.context.fetch(fR)
              self.tableListA = tableListA
              self.ALists.reloadData()
          }catch{
            print("error")
        }
          
          
    }

    // MARK: - Table view data source


    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
        
                PersistenceServce.context.delete(tableListA[indexPath.row])
                tableListA.remove(at: indexPath.row)
                ALists.deleteRows(at: [indexPath], with: .bottom)
           
               
                
            }
        }
    
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0
        }
        
        @IBAction func newAppointment(_ sender: UIButton){
           
            let msg = UIAlertController(title: "New Appointment", message: nil, preferredStyle: .alert)
              msg.addTextField{(textField) in
                 textField.placeholder = "Appointment Date"
              }
              msg.addTextField{(textField) in
                textField.placeholder = "Appointment Detail"
              }
                   let submit = UIAlertAction(title: "Sumbit", style: .default) { (action)->Void in
                           //self.tableListA.insert(input!, at: 0)
                          // self.ALists.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
                        let date = msg.textFields!.first!.text!
                        let detail = msg.textFields!.last!.text!
                        let Apointment = Appointments(context: PersistenceServce.context)
                        Apointment.date = date
                        Apointment.detail = detail
                        print(date)
                        print(detail)
                        PersistenceServce.saveContext()
                        self.tableListA.append(Apointment)
                        self.ALists.reloadData()
                    
                       
                   }
                   let cancel = UIAlertAction(title:"Cancel", style: .cancel){
                       (action) -> Void in
                    
                       
                   }
                   
                   msg.addAction(submit)
                   msg.addAction(cancel)
                
                   self.present(msg, animated: true, completion: nil)
        }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.font = UIFont(name: "Noteworthy", size: 27.0)
            cell.detailTextLabel?.font = UIFont(name: "Noteworthy", size: 22.0)
            cell.layer.borderWidth = 3
            cell.layer.cornerRadius = 0
            cell.clipsToBounds = true
            let color = UIColor(red: 0.96, green: 0.62, blue: 0.29, alpha: 1.00)
            cell.backgroundColor = color
            cell.textLabel?.text = tableListA[indexPath.row].date
            cell.detailTextLabel?.text = tableListA[indexPath.row].detail
            return cell
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 return self.tableListA.count
             }
    
    
    
    
}

