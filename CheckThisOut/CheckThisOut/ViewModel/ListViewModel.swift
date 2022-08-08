//
//  ListViewModel.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/7/22.
//

import SwiftUI
import Firebase


class ListViewModel: ObservableObject {
    
    @Published var list = [List]()
    @Published var showCreateListView: Bool = false
    @Published var filterListSelected: SelectedButton = .all
    @Published var listFiltered = [List]()
    
    init() {
        loadLists()
    }
    
    
    func loadLists() {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let query = COLLECTION_USERS.document(user.id ?? "").collection("lists").order(by: "title", descending: false) // by completed??
        
        query.getDocuments { snapsot, _ in
            
            guard let document = snapshot?.documents else {return}
            self.list = document.compactMap({ try? $0.data(as: List.self)})
            
            for index in stride(from: 0, through: self.list.count, by: 1) {
                self.list[index].documentID = document[index].documentID
            }
            
            self.listFiltered = self.list
            
            if self.filterListSelected != .all {
                self.listFiltered = self.list.filter { list in
                    return list.ListType == self.filterListSelected.rawValue
                }
            } else {
                self.listFiltered = self.list
                }
            }
        }
    
    func uploadList(list: List) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let data: [String: Any] = ["title": list.title,
                                   "descriptoin": list.description,
                                   "ListType": list.ListType,
//                                   "completed": list.completed,
                                   "ownerUid": user.id ?? ""]
        COLLECTION_USERS.document(user.id ?? "").collection("lists").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadLists()
        }
    }
    
    func deleteList(listId: String) {
        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
        
        COLLECTION_USERS.document(uid).collection("lists").document(listId).delete() { error in
            if let error = error {
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.loadLists()
    }
    
    }
    
//    func completeList(listId: String) {
//        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
//
//        COLLECTION_USERS.document(uid).collection("lists").document(listId).updateData(["copmleted": true])() { error in
//            if let error = error {
//                print("DEBUG: \(error.localizedDescription)")
//                return
//            }
//            self.loadLists()
//
//
//}
//    }
    
    //    func uncompleteList(listId: String) {
    //        guard let uid = AuthViewModel.shared.userSession?.uid else {return}
    //
    //        COLLECTION_USERS.document(uid).collection("lists").document(listId).updateData(["copmleted": false])() { error in
    //            if let error = error {
    //                print("DEBUG: \(error.localizedDescription)")
    //                return
    //            }
    //            self.loadLists()
    //
    //
    //}
    //    }
}
