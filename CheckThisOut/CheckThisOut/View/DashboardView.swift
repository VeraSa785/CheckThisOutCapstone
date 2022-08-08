//
//  DashboardView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/3/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    var body: some View {
        VStack {
            Text("DashboardView")
            Button {
                AuthViewModel.shared.signout()
            } label: {
                Text("Log out")
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
