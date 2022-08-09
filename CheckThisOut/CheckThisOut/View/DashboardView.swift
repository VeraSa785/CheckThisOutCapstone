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
                
                ScrollView {
                    
                    VStack(spacing: 15) {
                    ForEach(viewModel.listsFiltered, id: \.id) { list in
                        
                        if searchText == "" {
                            ListView(list: List(ownerUiD: list.ownerUiD, title: list.title, description: list.description, ListType: list.ListType, documentID: list.documentID), viewModel: viewModel)
                        } else {
                            if list.title.lowercased().contains(searchText.lowercased()) || list.description.lowercased().contains(searchText.lowercased()) {
                                ListView(list: List(ownerUiD: list.ownerUiD, title: list.title, description: list.description, ListType: list.ListType, documentID: list.documentID), viewModel: viewModel)
                            }// end of if statement
                        }
                        
                    } // end of foreach
                } //end of Vstack
                } //end of Scrollview

            }//end of Vstack
            
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.showCreateListView = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 60, height: 60)
                                .background(Color("Yellow"))
                                .cornerRadius(30)
                        }
                        .padding(20)
                    }
                }
            )
            
            if viewModel.showCreateListView {
                BlankView()
                CreateListView(user: user, viewModel: viewModel)
            }
            
        }//end of Zstack
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(user: appUser01)
    }
}
