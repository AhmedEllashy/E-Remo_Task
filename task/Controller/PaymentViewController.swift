//
//  PaymentViewController.swift
//  task
//
//  Created by Ahmad Ellashy on 18/04/2024.
//

import UIKit

class PaymentViewController: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var PayView: UIView!
    @IBOutlet weak var invoiceView: UIView!
    @IBOutlet weak var invoiceDetailsView: UIView!
    @IBOutlet weak var DataView: UIView!
    //MARK: - Built In Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedFuncs.addBorder(views: [invoiceView,invoiceDetailsView,PayView,DataView])
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
