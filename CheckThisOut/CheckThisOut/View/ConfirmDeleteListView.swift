//
//  ConfirmDeleteListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/16/22.
//

//do not have time to implement
import SwiftUI

struct ConfirmDeleteListView: View {
    
    let user: AppUser
    var list: CheckList
    
    @ObservedObject var viewModel: ListViewModel
    @State var showConfirmDeleteListView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Are you sure you want to delete this list?")
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 250,height: 50, alignment: .center)
                .padding(.bottom,8)
//                .frame(width: 290, alignment: .center)
//                        .border(Color.black, width: 3)
                .multilineTextAlignment(.center)
                .lineLimit(15)
            
            
            HStack {
                Button {
                    viewModel.deleteList(listId: list.documentID ?? "")
                    showConfirmDeleteListView = false
                } label: {
                    DeleteListButton()
                }
                
                Button {
                    showConfirmDeleteListView = false
                } label: {
                    CancelDeleteButton()
                }
            }
            .padding(.bottom,1)
            
            Spacer()
            
        }//end of Vstack
        .frame(width: UIScreen.main.bounds.size.width - 90, height: 150)
        .background(Color(.systemGray6))

    }
}

struct ConfirmDeleteListView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmDeleteListView(user: appUser01, list: list01, viewModel: ListViewModel())
    }
}


struct DeleteListButton: View {
    var body: some View {
        Text("Delete")
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 150, height: 40)
            .background(Color("Yellow"))
//            .background(Color(.white))
            .background(Color.black.opacity(0.6))
            .clipShape(Capsule())
    }
}

struct CancelDeleteButton: View {
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
