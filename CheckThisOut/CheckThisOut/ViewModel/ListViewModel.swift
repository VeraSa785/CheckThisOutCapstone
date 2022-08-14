//
//  ListViewModel.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/7/22.
//

import SwiftUI
import Firebase


class ListViewModel: ObservableObject {
    
    @Published var lists = [CheckList]()
    @Published var showCreateListView: Bool = false
    @Published var filterListSelected: SelectedButton = .all
    @Published var listsFiltered = [CheckList]()
    
    init() {
        loadLists()
    }
    
    
    func loadLists() {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let query = COLLECTION_USERS.document(user.id ?? "").collection("lists").order(by: "title", descending: false) // by completed??
        
        query.getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else {return}
            self.lists = documents.compactMap({ try? $0.data(as: CheckList.self)})
            
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
    
    func uploadList(list: CheckList) {
        guard let user = AuthViewModel.shared.currentUser else {return}
        
        let data: [String: Any] = ["title": list.title,
                                   "description": list.description,
                                   "ListType": list.ListType,
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
    
}
