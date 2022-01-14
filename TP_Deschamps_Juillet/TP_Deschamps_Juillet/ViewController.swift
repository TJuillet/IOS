//
//  ViewController.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 09/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var myData = [Todo]()
    var newData = [Todo]() //catégorie
    
    var categorie: String?

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearch: UISearchBar!
    
    @IBAction func changeEtat(_ sender: UISwitch) {
        let row = sender.tag
        filteredData[row].etat = sender.isOn
        myTableView.reloadData()
    }
    
    @IBAction func deleteTask(_ sender: UIButton) {
        let row = sender.tag
        var j=0
        for i in myData{
            if i.name == newData[row].name{
                myData.remove(at: j)
            }
            j=j+1
        }
        newData.remove(at: row)
        filteredData = newData
        myTableView.reloadData()
    }
    
    var filteredData: [Todo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        for row in myData{
            if row.categorie == categorie{
                newData.append(row)
            }
        }

        
        filteredData = newData
        //updateData()

        mySearch.delegate = self
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
            let row = indexPath.row
      
            cell.myName.text = filteredData[row].name
            cell.myEtat.tag = row
            cell.myEtat.isOn = filteredData[row].etat
            cell.myDelete.tag = row
            
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = "dd/MM/YY"
            cell.myDate.text = dataFormatter.string(from: filteredData[row].date)
            
            return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! DetailsViewController
            let myIndexPath = myTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailsViewController.myData = newData[row]
        }
    }
    
    
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        let vc = unwindSegue.source as! AddViewController
        let myNewCategorie = categorie!
        if let myNewName = vc.myNameField.text, let myNewDescription = vc.myDescriptionField.text, let myNewDate:Date = vc.myDate.date {
            let new_data = Todo(name: myNewName,
                            description: myNewDescription,
                            date:  myNewDate,
                            categorie: myNewCategorie)
            myData.append(new_data)
            //updateData()
            newData.append(new_data)
            newData.sort(by: {$0.date < $1.date})
            
            filteredData = newData
            myTableView.reloadData()
        }
    }
    /*func updateData(){
        for row in myData{
            if row.categorie == categorie{
                newData.append(row)
            }
        }
        myTableView.reloadData()
    }
 */
    @IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? AddViewController{
            vc.dismiss(animated: true, completion: nil)
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    

 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if mySearch.text == "" {
        filteredData = newData
    }
        else {
        for task in newData{
                    if task.name.lowercased().contains(searchText.lowercased()){
                        filteredData.append(task)
                    }
                }
    }
        
        self.myTableView.reloadData()
    }
 
}
