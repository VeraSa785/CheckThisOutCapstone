////
////  Tasks.swift
////  CheckThisOut
////
////  Created by Vera Sazonova on 8/10/22.
////
//
import Foundation
import SwiftUI
import FirebaseFirestoreSwift


struct Tasks: Identifiable, Decodable {

    @DocumentID var id: String? = UUID().uuidString  //create unique identifier
    let ownerUiD: String
//    let listId: String // list ID
//    let listTitle: String // list title
//    let listDescription: String // list description
//    let list: List
    var taskTitle: String
    var completed: Bool
    var documentID: String? = ""

}

//if DEBUG

let testDataTasks = [
    Tasks(ownerUiD: "1", taskTitle: "Potatoes", completed: false),
    Tasks(ownerUiD: "2", taskTitle: "Tomato", completed: false),
    Tasks(ownerUiD: "3", taskTitle: "Plum", completed: false)
]
//endif
