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
                    viewmodelobj.addImagestoAlbum(arrayindex, image)
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
        //return classModel[arrayindex].data.count
        return viewmodelobj.getCountOfImages(arrayindex)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else{
            return UICollectionViewCell()
        }
        cell.photoImage.image = viewmodelobj.getAllImagesOfAlbum(arrayindex)[indexPath.row]
        return cell
    }
}
//MARK: SETTING SIZE FOR COLLECTIONVIEW
extension Second: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone && UIDevice.current.orientation.isLandscape{
            return CGSize(width: collectionView.frame.width / 5 - 2, height: collectionView.frame.height / 3 - 2)
        } else if UIDevice.current.userInterfaceIdiom == .phone && !(UIDevice.current.orientation.isLandscape){
            return CGSize(width: collectionView.frame.width / 3 - 2, height: collectionView.frame.height / 4 - 2)
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            return CGSize(width: collectionView.frame.width / 5 - 2, height: collectionView.frame.height / 3 - 2)
        } else {
            print("Running on an unknown device")
        }
        return CGSize(width: collectionView.frame.width / 3 - 2, height: collectionView.frame.height / 3 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}
