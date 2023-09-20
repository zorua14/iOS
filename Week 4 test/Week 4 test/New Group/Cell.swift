//
//  Cell.swift
//  Week 4 test
//
//  Created by Karthikeyan Muthu on 20/09/23.
//

import UIKit

class Cell: UITableViewCell {

    
    @IBOutlet weak var jobName: UILabel!
    
    @IBOutlet weak var experience: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNames(_ datas:[String : String])
    {
        self.jobName?.text = datas["job name"]
        self.experience?.text = "\(datas["experience"] ?? "") years experience"
        self.desc?.text = datas["desc"]
        self.location?.text = datas["location"]
        self.number?.text = datas["contact"]
        
        
    }

    
}
