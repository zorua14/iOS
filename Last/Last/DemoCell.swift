//
//  DemoCell.swift
//  Last
//
//  Created by Karthikeyan Muthu on 16/09/23.
//

import UIKit

class DemoCell: UITableViewCell {

    
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var versionName: UILabel!
    
    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Inga layer
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setNames(_ datas:[String : String])
    {
        self.appName?.text = datas["app name"]
        self.versionName?.text = "Version: \(datas["version"] ?? "")"
        self.categoryName?.text = "Category: \(datas["category name"] ?? "")"
        
    }
    
}
