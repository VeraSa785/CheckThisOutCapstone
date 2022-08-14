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
    var taskTitle: String
    var completed: Bool
    var documentID: String? = ""

}

//if DEBUG

let testDataTasks = [
    Tasks(taskTitle: "Potatoes", completed: false),
    Tasks(taskTitle: "Tomato", completed: false),
    Tasks(taskTitle: "Plum", completed: false)
]
//endif
