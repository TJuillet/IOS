//
//  AddViewController.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 09/12/2021.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var myNameField: UITextField!
    @IBOutlet weak var myDescriptionField: UITextField!
    @IBOutlet weak var myDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDate.minimumDate = Date()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
