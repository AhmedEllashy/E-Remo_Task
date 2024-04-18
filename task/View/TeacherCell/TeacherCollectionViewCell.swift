//
//  TeacherCollectionViewCell.swift
//  task
//
//  Created by Ahmad Ellashy on 18/04/2024.
//

import UIKit

class TeacherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teacherImageView : UIImageView!
    @IBOutlet weak var teacherNameLabel : UILabel!
    @IBOutlet weak var teacherCostLabel : UILabel!
    @IBOutlet weak var teacherSubjectLabel : UILabel!
    @IBOutlet weak var bookView : UIView!
    @IBOutlet weak var bookLabel : UILabel!
    @IBOutlet weak var bookImageView : UIImageView!

    var isSelectedCell: Bool = false
   
   override func awakeFromNib() {
       super.awakeFromNib()
       self.clipsToBounds = true
       self.layer.cornerRadius = 10
       teacherImageView?.layer.cornerRadius = (teacherImageView?.frame.size.width ?? 0.0) / 2
       teacherImageView?.clipsToBounds = true
       teacherImageView?.layer.borderWidth = 3.0
       teacherImageView?.layer.borderColor = UIColor.white.cgColor
       bookView.layer.cornerRadius = 8.0
       // Initialization code
       checkIfSelectedUiState()
   }
   //MARK: - Functions
   func configure(_ model : TeacherProfile){
       teacherImageView.image = UIImage(named: model.image)
       teacherNameLabel.text = model.name
       teacherCostLabel.text = "\(model.price) EGP"
       teacherSubjectLabel.text = model.subject
   }
    func checkIfSelectedUiState(){
        if isSelectedCell {
            self.layer.borderColor = UIColor.green.cgColor
            self.layer.borderWidth = 2.0
            bookImageView.image = UIImage(systemName: "checkmark")
            bookLabel.text = "Booked"
            bookView.backgroundColor = .systemGreen
        }else{
            self.layer.borderColor = UIColor.clear.cgColor
            bookImageView.image = UIImage(systemName: "bookmark.circle.fill")
            bookLabel.text = "Book"
            bookView.backgroundColor = .systemBlue
        }
    }
   
   //MARK: - Static Vars
   static let cellName : String = "TeacherCollectionViewCell"
   static func nib() -> UINib {
       return UINib(nibName: cellName, bundle: nil)
   }

}
