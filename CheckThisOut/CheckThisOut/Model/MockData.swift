//
//  MockData.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/3/22.
//

import Foundation


let appUser01 = AppUser(id: "1", uid: "1", firstName: "John", lastName: "Parker", email: "john.p@gmai.com")

let list01 = CheckList(id: "1", ownerUiD: "1", title: "Costco", description: "List of products to buy", ListType: "Grocery")
let list02 = CheckList(id: "2", ownerUiD: "2", title: "Capstone", description: "", ListType: "School")
let list03 = CheckList(id: "3", ownerUiD: "3", title: "Do homework", description: "Ada Developers Academy", ListType: "School")



//let task01 = Tasks(id: "1", ownerUiD: "1", listId: "1", listTitle: "Costco", listDescription: "List of products to buy", taskTitle: "Tomatoes", completed: false)
//let task02 = Tasks(id: "2", ownerUiD: "2", listId: "1", listTitle: "Costco", listDescription: "List of products to buy", taskTitle: "Potatoes", completed: false)
//let task03 = Tasks(id: "3", ownerUiD: "3", listId: "1", listTitle: "Costco", listDescription: "List of products to buy", taskTitle: "Potatoes", completed: false)


let task01 = Tasks(id: "1", ownerUiD: "1", taskTitle: "Tomatoes", completed: false)
let task02 = Tasks(id: "2", ownerUiD: "2", taskTitle: "Potatoes", completed: false)
let task03 = Tasks(id: "3", ownerUiD: "3", taskTitle: "Toilet Paper", completed: false)
