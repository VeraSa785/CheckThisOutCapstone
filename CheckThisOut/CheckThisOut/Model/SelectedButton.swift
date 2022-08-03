//
//  SelectedButton.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/3/22.
//

import Foundation

enum SelectedButton: String {
    
    case all = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case adventure = "Adventure"
    case personal = "Personal"
    case extra = "Extra"
    
    func getValue() -> String {
        return self.rawValue
    }
    
}
