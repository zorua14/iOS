//
//  ViewController.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 29/09/23.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var searchLabel: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchLabel.layer.cornerRadius = 10
        tableview.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableview.dataSource = self
        tableview.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableview.reloadData()
    }

    @IBAction func addButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
}
//MARK: - TABLEVIEW EXTENSIONS
extension ContactViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let details  = viewmodel.getUser(indexPath.row)
        cell.setNames(details)
        
        return cell
    }
    
}

