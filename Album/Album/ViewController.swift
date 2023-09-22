//
//  ViewController.swift
//  Album
//
//  Created by Karthikeyan Muthu on 21/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [String]() 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
    
        collectionView.reloadData() // Refresh the collection view
        collectionView.collectionViewLayout = layout // flowLayout assinment
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DemoCell.nib(), forCellWithReuseIdentifier: "DemoCell")
        
    }
    //MARK: GET ALBUM NAME
    @IBAction func addAlbum(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Enter item name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            if let textField = alertController.textFields?.first, let newItem = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !newItem.isEmpty {
                self?.items.append(newItem)
                //album_name = newItem
                data.append([newItem: []])
                self?.collectionView.reloadData() // Refresh the collection view
            }
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }


}
//MARK: COLLLECTION EXTENSIONS
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCell", for: indexPath) as! DemoCell
        cell.layer.borderColor = UIColor.blue.cgColor
        var a = items[indexPath.row]
        cell.albumName.text = items[indexPath.row]
        cell.imageCount.text = "\(data[indexPath.row][a]?.count ?? 0) images"
        if let lastItem = data[indexPath.row][a]?.last {
            cell.bannerImage.image = lastItem
        }
        // cell customization
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone && UIDevice.current.orientation.isLandscape{
            return CGSize(width: collectionView.frame.width / 5 - 2, height: collectionView.frame.width / 3 - 2)
        } else if UIDevice.current.userInterfaceIdiom == .phone && !(UIDevice.current.orientation.isLandscape){
            return CGSize(width: collectionView.frame.width / 3 - 2, height: collectionView.frame.width / 3 - 2)
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: collectionView.frame.width / 5 - 2, height: collectionView.frame.width / 3 - 2)
        } else {
            print("Running on an unknown device")
        }
        return CGSize(width: collectionView.frame.width / 3 - 2, height: collectionView.frame.width / 3 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "Second") as! Second
        album_name = items[indexPath.row]
        arrayindex = indexPath.row
        //print(album_name)
        self.navigationController?.pushViewController(sc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}

