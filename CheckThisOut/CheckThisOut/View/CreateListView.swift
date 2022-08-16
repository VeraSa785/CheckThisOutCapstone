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
            
            ListTextField(text: $title, placeholder: "List") // no more than 46, when full description appear only 21 characters
                .padding([.horizontal, .bottom])
            
            //Displaying Count
            HStack {
                Spacer()
                
                Text("\(title.count)/46")
                    .foregroundColor(.black)
                    .font(.footnote)
            }
            .padding(.top, -19)
            .padding(.trailing,16)
            
            CustomTextEditor(text: $ListDescription, placeholder: Text("Description"), imageName: "line.3.horizontal", foregroundColor: .gray)
                .padding([.horizontal, .bottom]) // no more than 34
            
            //Displaying Count
            HStack {
                Spacer()
                
                Text("\(ListDescription.count)/34")
                    .foregroundColor(.black)
                    .font(.footnote)
            }
            .padding(.top, -19)
            .padding(.trailing,16)
            
            HStack {
                Button {
                    if (title.isEmpty == false) {
                        viewModel.uploadList(list: CheckList(ownerUiD: user.id ?? "", title: title, description: ListDescription, ListType: viewModel.filterListSelected == .all ? "Extra" : viewModel.filterListSelected.rawValue))
                        viewModel.showCreateListView = false
                    } else {
                        viewModel.showCreateListView = false
                    }
                    
                } label: {
                    CreateListButton()
                }
                
                Button {
                    viewModel.showCreateListView = false
                } label: {
                    CancelListButton()
                }
            }
            .padding(.bottom,24)
            
            Spacer()
            
        }//end of Vstack
        .frame(width: UIScreen.main.bounds.size.width - 100, height: 380)
//        .background(Color(.systemGray6))
//        .background(Color("Yellow").opacity(0.9))
        .background(Color("Yellow"))
//        .background(Color.yellow.opacity(0.2))
//        .background(Color.purple.opacity(0.1))
//        .cornerRadius(10)
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
//            .background(Color("Yellow"))
            .background(Color(.white))
            .background(Color.black.opacity(0.6))
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
//            .background(Color.white.opacity(0.6))
            .background(Color.black)
            .clipShape(Capsule())
    }
}
