//
//  TasksViewModel.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/10/22.
//

import SwiftUI
import Firebase


class TasksViewModel: ObservableObject {
    
    var list : CheckList
    @Published var tasks = [Tasks]()
    @Published var showCreateTasksView: Bool = false
    
    init(list: CheckList) {
        self.list = list
        loadTasks()
    }
    
    
    func loadTasks() {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let query = COLLECTION_USERS.document(user.id ?? "").collection("lists").document(list.documentID!).collection("tasks").order(by: "taskTitle", descending: false)
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else {return} //if value doesnt exist it will return
            self.tasks = documents.compactMap({ try! $0.data(as: Tasks.self)})
            
            for index in stride(from: 0, to: self.tasks.count, by: 1) {
                self.tasks[index].documentID = documents[index].documentID // increase by one, track index
            }
            
        }
    }
    
   
    func createNewTask(task: Tasks) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let data: [String: Any] = ["ownerUiD": task.id ?? "",
                                   "taskTitle": "",
                                   "completed": false
        ]
        COLLECTION_USERS.document(user.id ?? "").collection("lists").document(list.documentID!).collection("tasks").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
        }
    }
    
    func uploadTask(task: Tasks) {
        guard let user = AuthViewModel.shared.currentUser else {return}

        let data: [String: Any] = ["ownerUiD": task.id ?? "",
                                   "taskTitle": task.taskTitle,
                                   "completed": task.completed
        ]
        COLLECTION_USERS.document(user.id ?? "").collection("lists").document(list.documentID!).collection("tasks").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
        }
    }
    
    
    func updateTask(taskId: String, task: Tasks) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("lists").document(list.documentID!).collection("tasks").document(taskId).updateData(["taskTitle": task.taskTitle]){ error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
        }
    }
    
    func deleteTask(taskId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("lists").document(list.documentID!).collection("tasks").document(taskId).delete() { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
        }
        
    }
    
    func completeTask(taskId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("lists").document(list.documentID!).collection("tasks").document(taskId).updateData(["completed": true]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
            
            
        }
    }
    
    func uncompleteTask(taskId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("lists").document(list.documentID!).collection("tasks").document(taskId).updateData(["completed": false]) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadTasks()
            
            
        }
    }
}
