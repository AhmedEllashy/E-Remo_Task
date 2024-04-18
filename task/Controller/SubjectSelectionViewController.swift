//
//  ViewController.swift
//  task
//
//  Created by Ahmad Ellashy on 17/04/2024.
//

import UIKit

class SubjectSelectionViewController: UIViewController{
    //MARK: - IBOUTLETS
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var subjectCollectionView : UICollectionView!
    //MARK: - Properties
    var subjects : [Subject] = [
    Subject(image: "chemistry", name: "Math"),
    Subject(image: "chemistry", name: "Math"),
    Subject(image: "chemistry", name: "Math"),
    Subject(image: "chemistry", name: "Math"),
    Subject(image: "chemistry", name: "Math"),
    Subject(image: "chemistry", name: "Math"),

    ]
    //MARK: - Built In Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    //MARK: - Functions
    func setup(){
        subjectCollectionView.delegate = self
        subjectCollectionView.dataSource = self
        topView.layer.cornerRadius = 40
        topView.clipsToBounds = true
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        subjectCollectionView.register(SubjectCollectionViewCell.nib(), forCellWithReuseIdentifier: SubjectCollectionViewCell.cellName)
    }

}
//MARK: - Collection View Delegate
extension SubjectSelectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subjects.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.cellName, for: indexPath) as! SubjectCollectionViewCell
        cell.configure(subjects[indexPath.row])
        return cell
    }
}
//MARK: - Collection View Layout
extension SubjectSelectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = 10.0 * 3.0
        let collectionSize = subjectCollectionView.frame.size
        let avalibleWidth = collectionSize.width - paddingSpace
        let widthPerItem = avalibleWidth / 2
        return CGSize(width: widthPerItem  , height: widthPerItem / 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
}

extension SubjectSelectionViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
       let itemCell =  collectionView.cellForItem(at: indexPath) as! SubjectCollectionViewCell
        if itemCell.isSelectedCell == false {
            itemCell.isSelectedCell = true
            itemCell.awakeFromNib()
        }else{
            itemCell.isSelectedCell = false
            itemCell.awakeFromNib()
        }
 
        
    }

}
