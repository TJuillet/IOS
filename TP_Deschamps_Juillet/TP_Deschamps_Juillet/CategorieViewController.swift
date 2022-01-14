//
//  CategorieViewController.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 17/12/2021.
//

import UIKit

class CategorieViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var myTableView: UITableView!
    
    var myData = [Todo]()
    var myCategorie = [TodoList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        myCategorie.append(TodoList(name: "Perso"))
        myCategorie.append(TodoList(name: "Travail"))
        
        myData.append(Todo(name: "Faire courses",
                           description: "Lait / Pain / Oeufs",
                           categorie: "Perso"))
        myData.append(Todo(name: "Compte Rendu Thivent",
                           description: "Parties 2 et 3 à finir",
                           categorie: "Travail"))
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCategorie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCategorieCell", for: indexPath) as! CategorieTableViewCell
        let row = indexPath.row
        cell.myCategorie.text = myCategorie[row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categorie" {
            let viewController = segue.destination as! ViewController
            let myIndexPath = myTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            viewController.categorie = myCategorie[row].name
            viewController.myData = myData
        }
    }
    
    @IBAction func back(_ unwindSegue: UIStoryboardSegue){
        if let viewController = unwindSegue.source as? ViewController{
            viewController.dismiss(animated: true, completion: nil)
            myData = viewController.myData
        }
    }
    
    @IBAction func add(_ unwindSegue: UIStoryboardSegue){
        if let acvc = unwindSegue.source as? AddCategorieViewController{
            acvc.dismiss(animated: true, completion: nil)
            myCategorie.append(TodoList(name:acvc.myField.text!))
            myTableView.reloadData()
        
        }
    }
}
