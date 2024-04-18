//
//  ProceedPaymentViewController.swift
//  task
//
//  Created by Ahmad Ellashy on 18/04/2024.
//

import UIKit

class ProceedPaymentViewController: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var cashPaymentView: UIView!
    @IBOutlet weak var StepperView: UIView!
    @IBOutlet weak var MobileWalletView: UIView!
    @IBOutlet weak var CardEntryView: UIView!
    @IBOutlet weak var CreditAndDebitView: UIView!
    //MARK: - Built In Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        SharedFuncs.addBorder(views: [cashPaymentView,StepperView,MobileWalletView,CardEntryView,CreditAndDebitView])
    }



}
