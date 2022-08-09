//
//  CreateListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct CreateListView: View {
    
    let user: AppUser
    
    @State var title: String = ""
    @State var ListDescription: String = ""
    @State var ListType: String = ""
//    @State var completed: Bool = false
    
    @ObservedObject var viewModel: ListViewModel
    
    
    var body: some View {
        VStack {
            
            ListButtonStack(viewModel: viewModel)
                .padding()
                .padding(.top)
            
            ListTextField(text: $title, placeholder: "List")
                .padding([.horizontal, .bottom])
            
            CustomTextEditor(text: $ListDescription, placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom])
            
            HStack {
                Button {
                    viewModel.uploadList(list: List(ownerID: user.id ?? "", title: title, description: ListDescription, ListType: viewModel.filterListSelected == .all ? "Extra" : viewModel.filterListSelected.rawValue))
                    viewModel.showCreateListView = false
                } label: {
                    CreateListButton()
                }
                
                Button {
                    viewModel.showCreateListView = false
                } label: {
                    CancelListButton()
                }
            }
            .padding(.bottom,20)
            
            Spacer()
            
        }//end of Vstack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 360)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView(user: appUser01, viewModel: ListViewModel())
    }
}


struct CreateListButton: View {
    var body: some View {
        Text("Create")
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 150, height: 40)
            .background(Color("Yellow"))
//            .background(Color.black.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct CancelListButton: View {
    var body: some View {
        Text("Cancel")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 100, height: 40)
//            .background(Color.white.opacity(0.6))
            .background(Color.black)
            .clipShape(Capsule())
    }
}
