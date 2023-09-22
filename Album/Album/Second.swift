//
//  Second.swift
//  Album
//
//  Created by Karthikeyan Muthu on 22/09/23.
//
import PhotosUI
import Photos
import UIKit

class Second: UIViewController {

    var imageArray = [UIImage]()
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPics(_ sender: Any) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images
        let phPickerVC = PHPickerViewController(configuration: config)
        phPickerVC.delegate = self
        self.present(phPickerVC,animated: true)
        
    }
    

}
//MARK: PHOTO PICKER EXTENSION
extension Second: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    data[arrayindex][album_name]?.append(image)
                }
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                }
            }
        }
    }
    
    
}
//MARK: COLLECTION EXTENSION
extension Second: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[arrayindex][album_name]?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else{
            return UICollectionViewCell()
        }
        // do this if data and its constituent array is not empty
        cell.photoImage.image = data[arrayindex][album_name]?[indexPath.row]
        //print(data)
        return cell
    }
}
//MARK: SETTING SIZE FOR COLLECTIONVIEW
extension Second: UICollectionViewDelegateFlowLayout{
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}
