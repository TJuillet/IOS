//
//  DetailsViewController.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 09/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var myData: Todo?
    
    @IBOutlet weak var myName: UILabel!
    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myEtat: UILabel!
    @IBOutlet weak var myDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/YY"
        
        if let data = myData{
            myName.text = data.name
            myDescription.text = data.description
            if (data.etat == true){
                myEtat.text = "Terminé"
            }else{
                myEtat.text = "En cours"
            }
            myDate.text = dataFormatter.string(from: data.date)
        }
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
