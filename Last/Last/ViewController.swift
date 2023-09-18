//
//  ViewController.swift
//  Last
//
//  Created by Karthikeyan Muthu on 16/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedCategory: String?
    var isFilteringEnabled = false

    
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
    
    let categoryOptions = ["EDUCATION", "SOCIAL NETWORKING", "TRAVEL", "NEWS", "MARKETING", "None of These"]

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
    
    // Call to enable and disable filtering
    
    func filterTableView(withCategory category: String?) {
        if isFilteringEnabled {
            selectedCategory = category
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
        if section == 0 {
            return updated.count
        } else
        {
            return notUpdated.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell") as! DemoCell
        var data: [String: String]?
        data = getDataForIndexPath(indexPath)
        if  let dat = getDataForIndexPath(indexPath) {
            
                // Check if filtering is enabled and the cell's category matches the selected category
            
                if isFilteringEnabled, let selectedCategory = selectedCategory, let cellCategory = dat["category name"], selectedCategory != cellCategory {
                    cell.isHidden = true // Hide the cell if it doesn't match the selected category
                } else {
                     
                            if indexPath.section == 0 {
                                    data = updated[indexPath.row]
                                    cell.updateButton.isHidden = true
                                    cell.updateButton.isEnabled = false
                            }
                            else
                            {
                                data = notUpdated[indexPath.row]
                                cell.updateButton.isHidden = false
                                cell.updateButton.isEnabled = true
                            }

                    cell.isHidden = false // Ensure the cell is not hidden
                }
            } else {
                cell.isHidden = true // Hide the cell if there's no data for the indexPath
            }
     
                
        // Configure cell labels with data
        cell.setNames(data!)
        cell.updateButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return cell
    }
    
    func getDataForIndexPath(_ indexPath: IndexPath) -> [String: String]? {
        var dataArray: [[String: String]] = []

        // Determine which array to use based on the section
        if indexPath.section == 0 {
                dataArray = updated
            } else if indexPath.section == 1 {
                dataArray = notUpdated
            } else {
                return nil // Return nil if the section is out of bounds
            }
            
            // Check if the indexPath.row is within bounds for the selected array
            if indexPath.row >= 0 && indexPath.row < dataArray.count {
                return dataArray[indexPath.row]
            } else {
                return nil // Return nil if the indexPath is out of bounds
            }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Updated Section"
        } else {
            return "Not Updated Section"
        }
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
        let selectedCategory = categoryOptions[row]
        
        if selectedCategory != "None of These" {
            isFilteringEnabled = true
            filterTableView(withCategory: selectedCategory)
        } else {
            isFilteringEnabled = false
            tableView.reloadData() // Show all cells when "None of These" is selected
        }
        pickerview.isHidden = true
    }

}
