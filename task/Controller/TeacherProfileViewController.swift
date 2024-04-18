//
//  TeacherProfileViewController.swift
//  task
//
//  Created by Ahmad Ellashy on 18/04/2024.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var topView : UIView!
    @IBOutlet weak var searchView : UIView!
    @IBOutlet weak var teachersCollectionView : UICollectionView!
    //MARK: - Properties
    var teachers : [TeacherProfile] = [
        TeacherProfile(name: "Ahmad Ellashy", image: "p1", price: "4600", subject: "Math Subject"),
        TeacherProfile(name: "Mahmoud Ali", image: "p2", price: "5200", subject: "Science Subject"),
        TeacherProfile(name: "Loay Fady", image: "p3", price: "2100", subject: "Math Subject"),
        TeacherProfile(name: "Ali Ahmad", image: "p4", price: "1600", subject: "Math Subject"),
        TeacherProfile(name: "Ahmad Ellashy", image: "p3", price: "4600", subject: "Math Subject"),
    ]
    //MARK: - Built In Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    @IBAction func BackButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    //MARK: - Functions
    func setup(){
        teachersCollectionView.delegate = self
        teachersCollectionView.dataSource = self
        topView.layer.cornerRadius = 40
        searchView.layer.cornerRadius = 20
        topView.clipsToBounds = true
        topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        teachersCollectionView.register(TeacherCollectionViewCell.nib(), forCellWithReuseIdentifier: TeacherCollectionViewCell.cellName)
    }

}
//MARK: - Collection View Delegate
extension TeacherProfileViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teachers.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeacherCollectionViewCell.cellName, for: indexPath) as! TeacherCollectionViewCell
        cell.configure(teachers[indexPath.row])
        return cell
    }
}
//MARK: - Collection View Layout
extension TeacherProfileViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = 10.0 * 3.0
        let collectionSize = teachersCollectionView.frame.size
        let avalibleWidth = collectionSize.width - paddingSpace
        let widthPerItem = avalibleWidth / 2
        return CGSize(width: widthPerItem  , height: widthPerItem + 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
}

extension TeacherProfileViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
       let itemCell =  collectionView.cellForItem(at: indexPath) as! TeacherCollectionViewCell
        if itemCell.isSelectedCell == false {
            itemCell.isSelectedCell = true
            itemCell.awakeFromNib()
        }else{
            itemCell.isSelectedCell = false
            itemCell.awakeFromNib()
        }
 
        
    }

}
