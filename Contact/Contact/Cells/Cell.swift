//
//  Cell.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 01/10/23.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var followBtn: UIButton!
    
    var changed = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        displayImage.layer.cornerRadius = 20
        view.layer.cornerRadius = 4
    
        view.layer.borderColor = UIColor.gray.cgColor
        followBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - SET DATA
    func setNames(_ arr:[String]){
        firstName.text = arr[0]
        lastName.text = arr[1]
    }
    @objc func buttonPressed() {
        if changed == false{
            followBtn.setTitle("Following", for: .normal)
            followBtn.setTitleColor(.gray, for: .normal)
            changed = true
        }
        else{
            followBtn.setTitle("Follow", for: .normal)
            followBtn.setTitleColor(.red, for: .normal)
            changed = false

        }
        
    }
    
}
