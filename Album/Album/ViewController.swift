//
//  ViewController.swift
//  Album
//
//  Created by Karthikeyan Muthu on 21/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [String]() // Your data source

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        //layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DemoCell.nib(), forCellWithReuseIdentifier: "DemoCell")
        
    }
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
                data.append([album_name: []])
                self?.collectionView.reloadData() // Refresh the collection view
            }
            
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCell", for: indexPath) as! DemoCell
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.albumName.text = items[indexPath.row]
        //cell.cellImage.image = UIImage(named: "Daco_1512387")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - 20)/4
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "Second") as! Second
        album_name = items[indexPath.row]
        arrayindex = indexPath.row
        print(album_name)
        self.navigationController?.pushViewController(sc, animated: true)
    }
    
    
}

