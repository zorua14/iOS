//
//  AlbumViewController.swift
//  Album
//
//  Created by Karthikeyan Muthu on 26/09/23.
//

import Foundation
import UIKit
//this is viewmodel 
class AlbumViewModel{
    var arrayOfAlbum = [AlbumModel]()
    
    func addAlbum(_ name: String)
    {
        arrayOfAlbum.append(AlbumModel(name: name))
    }
    
    func addImagestoAlbum(_ ind:Int,_ imagetoAdd:UIImage)
    {
        arrayOfAlbum[ind].addImages(imagetoAdd)
    }
    func getarrayOfAlbum() -> [AlbumModel]{
        return arrayOfAlbum
    }
    func getcountOfAlbum() -> Int{
        return arrayOfAlbum.count
    }
    func getCountOfImages(_ ind:Int) -> Int{
        return arrayOfAlbum[ind].getNumberOfImages()
    }
    func getAllImagesOfAlbum(_ ind:Int) -> [UIImage]{
        return arrayOfAlbum[ind].getAllImages()
    }
}
