//
//  ViewController.swift
//  Last
//
//  Created by Karthikeyan Muthu on 16/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedCategory = "None of These"
    
    var filterSelected  = false
    
    @IBAction func filter(_ sender: Any) {
        
        if pickerview.isHidden{
            pickerview.isHidden = false
        }

    }
    
    @IBOutlet weak var pickerview: UIPickerView!
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - DUMMY DATA
    var updated: [[String: String]] = [[
        "app name": "summma",
        "version": "ok",
        "category name": "ui"
        ]
    ]

   // var notUpdated: [[String: String]] = []
    var notUpdated: [[String: String]] = [[
        "app name": "Not updated",
        "version": "ok",
        "category name": "ui"
        ]
    ]
    
    let categoryOptions = ["EDUCATION","SOCIAL NETWORKING","TRAVEL","NEWS","MARKETING", "None of These"]

//MARK:  FUNCTIONS 
    
    @objc func buttonPressed(_ sender: UIButton) {
        // Get the indexPath of the cell containing the pressed button
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            // Get the data associated with the cell from notUpdatedData
            let dataToMove = notUpdated[indexPath.row]
            
            // Remove the data from notUpdatedData
            notUpdated.remove(at: indexPath.row)
            
            // Add the data to updatedData
            updated.append(dataToMove)
            
            // Reload the table view to reflect the changes
            sortArrayOfDictionariesByAppNameIfNotEmpty(&updated)

            tableView.reloadData()
        }
    }
    
   
    func sortArrayOfDictionariesByAppNameIfNotEmpty(_ array: inout [[String: String]]) {
        if !array.isEmpty {
            array.sort { (dict1, dict2) in
                guard let appName1 = dict1["app name"], let appName2 = dict2["app name"] else {
                    return false
                }
                
                return appName1 < appName2
            }
        }
    }

// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "DemoCell", bundle: nil), forCellReuseIdentifier: "DemoCell")
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        pickerview.isHidden = true
        pickerview.delegate = self
        pickerview.dataSource = self
    }
    
    // MARK: - NAVIGATION
    @IBAction func newApp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "Second") as! Second
        sc.delegate = self
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
}

// MARK: - TABLE VIEW EXTENSIONS


extension ViewController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        if selectedCategory == "None of These"
        {
            return section == 0 ? updated.count : notUpdated.count
        }
        else{
            if section == 0 {
                print(updated.filter { $0["category name"] == selectedCategory}.count)

                return updated.filter { $0["category name"] == selectedCategory}.count
            }
            else{
                print(notUpdated.filter { $0["category name"] == selectedCategory}.count)
                return notUpdated.filter { $0["category name"] == selectedCategory}.count
                

            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell") as! DemoCell
        
        // Configure cell labels with data
        
        if filterSelected == false {
                    // Filter and display data based on the specified category
            if indexPath.section == 0 {
                        let appInfo = updated[indexPath.row]
                        cell.setNames(appInfo)
                        cell.updateButton.isHidden = true
                        cell.updateButton.isEnabled = false


                    } else {
                        let appInfo = notUpdated[indexPath.row]
                        cell.setNames(appInfo)
                        cell.updateButton.isHidden = false
                        cell.updateButton.isEnabled = true

                    }

            
                } else {
                    
                if indexPath.section == 0 {
                        let filteredUpdatedData = updated.filter { $0["category name"] == selectedCategory }
                        let appInfo = filteredUpdatedData[indexPath.row]
                        cell.setNames(appInfo)
                        cell.updateButton.isHidden = true
                        cell.updateButton.isEnabled = false

                    } else {
                        let filteredNotUpdatedData = notUpdated.filter { $0["category name"] == selectedCategory }
                        let appInfo = filteredNotUpdatedData[indexPath.row]
                        cell.setNames(appInfo)
                        cell.updateButton.isHidden = false
                        cell.updateButton.isEnabled = true

                    }

                    
                }

        
        cell.updateButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell") as! TitleCell
        
        if section == 0{
            cell.sectionTitle.text = "Updated Section"
        }
        else{
            cell.sectionTitle.text = "Not Updated Section"

        }
        return cell

    }
    
    
}

// MARK: - DATAPASSING

extension ViewController: dataPassing{
    func pass(data: [String]) {

        let newData: [String: String] = [
                    "app name": data[0],
                    "version": data[1],
                    "category name": data[2]
                ]
        
        notUpdated.append(newData)
        sortArrayOfDictionariesByAppNameIfNotEmpty(&notUpdated)
        tableView.reloadData()
    }
}


extension ViewController:UITableViewDelegate{
    
}

// MARK: - UIPICKER EXTENSIONS

extension ViewController:UIPickerViewDataSource, UIPickerViewDelegate{
    // UIPickerViewDataSource methods
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1 // Single component (list of categories)
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return categoryOptions.count
        }

        // UIPickerViewDelegate methods
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return categoryOptions[row]
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedCategory = categoryOptions[row]
            print(selectedCategory)
            
            if selectedCategory != "None of These"{
                filterSelected = true
            }
            else{
                filterSelected = false
            }
            tableView.reloadData() // Show all cells when "None of These" is selected
        
           pickerview.isHidden = true
    }

}
