//
//  ListScreenViewController.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import UIKit

class ListScreenViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    
    
    var usrIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "DemoCell", bundle: nil), forCellReuseIdentifier: "DemoCell")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableview.reloadData()
    }

    @objc func buttonPressed(_ sender: UIButton) {
        // Get the indexPath of the cell containing the pressed button
        let point = sender.convert(CGPoint.zero, to: tableview)
        if let indexPath = tableview.indexPathForRow(at: point) {
            DataManager.shared.deleteJob(usrIndex, indexPath.row)
            tableview.reloadData()
            }
    }


    @IBAction func addJobBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "AddJobViewController") as! AddJobViewController
        sc.index = usrIndex
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
}

extension ListScreenViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.getUser(usrIndex).getJobCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoCell") as! DemoCell
        let usr = viewmodel.getUser(usrIndex)
        let details = usr.getJobs()
        print(details[indexPath.row].getData())
        cell.setNames(details[indexPath.row].getData())
        //
        cell.deleteBtn.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let usr = viewmodel.getUser(usrIndex)
        let details = usr.getJobs()
        return "\(details.count) jobs available"
    }
    
    
}
