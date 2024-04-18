//
//  SharedFuncs.swift
//  task
//
//  Created by Ahmad Ellashy on 18/04/2024.
//

import UIKit

struct SharedFuncs{
    static func addBorder(views : [UIView]){
        for view in views {
            view.layer.cornerRadius = 10.0
        }
    }
}
