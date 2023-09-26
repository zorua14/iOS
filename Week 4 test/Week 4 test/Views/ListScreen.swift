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
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        // Get the indexPath of the cell containing the pressed button
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            // Remove the data from datasource
            viewmodel.removeUser(indexPath.row)
            tableView.reloadData()
        }
    }
}
//MARK: - TABLEVIEW EXTENSIONS
extension ListScreen:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let details = viewmodel.getUser(indexPath.row)
        cell.setNames(details)
        cell.deleteBtn.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if viewmodel.getCount() == 0 {
            return "No Jobs Available"
        }
        else{
            return "\(viewmodel.getCount()) jobs available"
        }
    }
}

