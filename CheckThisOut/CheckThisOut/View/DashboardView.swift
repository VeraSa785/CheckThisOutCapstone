//
//  DashboardView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/3/22.
//

import SwiftUI

struct DashboardView: View {
    
    let user: AppUser
    
    @State var searchText: String = ""
    
    @ObservedObject var viewModel = ListViewModel() //buggy
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("Check This Out!")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                } // end of Hstack
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            AuthViewModel.shared.signout()
                        } label: {
                            Text("Log out")
                                .foregroundColor(Color(.systemGray))
                        }
                        .padding(.trailing)
                    }
                } // end of HStack overlay
                
                SearchBarView(searchText: $searchText)
                    .padding()
                
                ListButtonStack(viewModel: viewModel) //buggy
                    .padding(.horizontal)
                    .padding(.bottom)
                
                if viewModel.listsFiltered.isEmpty {
                    AddListLogo()
                        .padding(.top,50)
                }
                
            }//end of Vstack
            
        }//end of Zstack
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
