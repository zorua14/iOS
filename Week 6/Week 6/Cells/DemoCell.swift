//
//  DemoCell.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import UIKit

class DemoCell: UITableViewCell {

    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    @IBOutlet weak var jobname: UILabel!
    
    @IBOutlet weak var exp: UILabel!
    
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.contentView.layer.cornerRadius = 4
//
//        self.contentView.layer.masksToBounds = true
        innerView.layer.cornerRadius = 4
        innerView.layer.borderWidth = 1

        innerView.layer.borderColor = UIColor(red: 0.925, green: 0.906, blue: 0.906, alpha: 1).cgColor
        innerView.layer.cornerRadius = 4
        innerView.layer.masksToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNames(_ datas:[String])
    {
        self.jobname?.text = datas[0]
        self.exp?.text = "\(datas[1]) years experience"
        self.desc?.text = datas[4]
        self.location?.text = datas[2]
        self.phone?.text = datas[3]
    }

    

}
