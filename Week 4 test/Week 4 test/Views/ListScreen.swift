//
//  ViewController.swift
//  Week 4 test
//
//  Created by Karthikeyan Muthu on 20/09/23.
//

import UIKit

class ListScreen: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addJobbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "AddJobScreen") as! AddJobScreen
        sc.delegate = self
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self

    }
    @objc func buttonPressed(_ sender: UIButton) {
        // Get the indexPath of the cell containing the pressed button
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
        
            
            // Remove the data from datasource
            
            source.remove(at: indexPath.row)
            sortArrayOfDictionariesByAppNameIfNotEmpty(&source)
            tableView.reloadData()
        }
    }
    func sortArrayOfDictionariesByAppNameIfNotEmpty(_ array: inout [[String: String]]) {
        if !array.isEmpty {
            array.sort { (dict1, dict2) in
                guard let appName1 = dict1["job name"], let appName2 = dict2["job name"] else {
                    return false
                }
                
                return appName1 < appName2
            }
        }
    }
    
    //var source: [[String: String]] = []


}
extension ListScreen:dataPassing{
    func pass(data: [String]) {
        let newData: [String: String] = [
            "job name": data[0],
            "experience": data[1],
            "location": data[2],
            "contact": data[3],
            "desc": data[4]
            ]
        source.append(newData)
        sortArrayOfDictionariesByAppNameIfNotEmpty(&source)
        tableView.reloadData()

    }
    
    
}
extension ListScreen:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let details = source[indexPath.row]
        cell.setNames(details)
        cell.deleteBtn.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if source.count == 0 {
            return "No Jobs Available"
        }
        else{
            return "\(source.count) jobs available"
        }
    }
    
    
}

