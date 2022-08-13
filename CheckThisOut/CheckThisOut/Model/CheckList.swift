//
//  List.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct CheckList: Identifiable, Decodable {
    
    @DocumentID var id: String? = UUID().uuidString  //create unique identifier
    let ownerUiD: String
    var title: String
    var description: String
    var ListType: String
    var documentID: String? = ""
    
    func getTypr() -> SelectedButton {
        if ListType == "Groceries" {
            return .groceries
        } else if ListType == "Work" {
            return .work
        } else if ListType == "Adventure" {
            return .adventure
        } else if ListType == "Home" {
            return .home
        } else if ListType == "School" {
            return .school
        } else if ListType == "Personal" {
            return .personal
        } else {
            return .extra
        }
    }
    
}
