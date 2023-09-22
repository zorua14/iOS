//
//  DemoCell.swift
//  Album
//
//  Created by Karthikeyan Muthu on 21/09/23.
//

import UIKit

class DemoCell: UICollectionViewCell {

    @IBOutlet weak var albumName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib {
        return UINib(nibName: "DemoCell", bundle: nil)
    }
    

}
