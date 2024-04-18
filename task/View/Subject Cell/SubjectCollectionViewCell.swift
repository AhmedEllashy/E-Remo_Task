//
//  SubjectCollectionViewCell.swift
//  task
//
//  Created by Ahmad Ellashy on 17/04/2024.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOUTLETS
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var selectedImageView : UIImageView!
    @IBOutlet weak var subjectName : UILabel!
    @IBOutlet weak var selectedUIView : UIView!
     var isSelectedCell: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 0.9
        self.layer.borderColor = UIColor.systemGray4.cgColor
        // Initialization code
        selectedImageView.image = nil
        selectedUIView.backgroundColor = .red
        if isSelectedCell {
            self.layer.borderColor = UIColor.green.cgColor
            selectedImageView.image = UIImage(systemName: "checkmark")
            selectedUIView.backgroundColor = .green
        }
    }
    //MARK: - Functions
    func configure(_ model : Subject){
        imageView.image = UIImage(named: model.image)
        subjectName.text = model.name
   
    }
    
    //MARK: - Static Vars
    static let cellName : String = "SubjectCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: cellName, bundle: nil)
    }

}
