//
//  checkingData.swift
//  Album
//
//  Created by Karthikeyan Muthu on 22/09/23.
//

import Foundation

import UIKit

var album_name = ""
var arrayindex: Int = 0
 //this is model

class AlbumModel{
    var name:String
    var data = [UIImage]()
    init(name: String) {
        self.name = name
        
    }
    func addImages(_ img : UIImage)
    {
        self.data.append(img)
    }
    func getNumberOfImages() -> Int{
        return data.count
    }
    func getAllImages() -> [UIImage]{
        return data
    }
}

