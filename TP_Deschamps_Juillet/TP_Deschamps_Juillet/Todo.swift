//
//  Todo.swift
//  TP_Deschamps_Juillet
//
//  Created by Antonin Deschamps on 09/12/2021.
//

import Foundation

class Todo {
    var name: String
    var description: String
    var etat: Bool
    var date: Date
    var categorie: String
    
    init(name: String, description: String, etat: Bool = false, date: Date = Date(), categorie: String){
        self.name = name
        self.description = description
        self.etat = etat
        self.date = date
        self.categorie = categorie
    }
}
