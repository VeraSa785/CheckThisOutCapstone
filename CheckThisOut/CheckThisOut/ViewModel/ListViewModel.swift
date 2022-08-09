//
//  ListViewModel.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/7/22.
//

import SwiftUI
import Firebase


class ListViewModel: ObservableObject {

    @Published var lists = [List]()
    @Published var showCreateListView: Bool = false
    @Published var filterListSelected: SelectedButton = .all
    @Published var listsFiltered = [List]()

    init() {
        loadLists()
    }


    func loadLists() {
        guard let user = AuthViewModel.shared.currentUser else {return}

        let query = COLLECTION_USERS.document(user.id ?? "").collection("lists").order(by: "title", descending: false) // by completed??

        query.getDocuments { snapshot, _ in

            guard let documents = snapshot?.documents else {return}
            self.lists = documents.compactMap({ try? $0.data(as: List.self)})

            for index in stride(from: 0, to: self.lists.count, by: 1) {
                self.lists[index].documentID = documents[index].documentID
            }

            self.listsFiltered = self.lists

            if self.filterListSelected != .all {
                self.listsFiltered = self.lists.filter { list in
                    return list.ListType == self.filterListSelected.rawValue
                }
            } else {
                self.listsFiltered = self.lists
                }
            }
        }

    func uploadList(list: List) {
        guard let user = AuthViewModel.shared.currentUser else {return}

        let data: [String: Any] = ["title": list.title,
                                   "description": list.description,
                                   "ListType": list.ListType,
//                                   "completed": list.completed,
                                   "ownerUiD": user.id ?? ""]
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
