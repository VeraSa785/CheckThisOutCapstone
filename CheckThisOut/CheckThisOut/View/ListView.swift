//
//  ListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct ListView: View {
    
    var list: List
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        HStack {
            
//            Button {
//                if list.completed {
//                    viewModel.unCompleteList(listId: list.documentID ?? "")
//                } else {
//                    viewModel.completeList(listId: list.documentID ?? "")
//                }
//            } label: {
//                Image(systemName: list.completed ? "checkmark.square.fill" : "square")
//                    .resizable()
//                    .frame(width: 25, height: 25)
//                    .foregroundColor(Color(.black))
//            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(list.title)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                if list.description != "" {
                    HStack {
//                        Image(systemName: "line.3.horizontal")
//                            .resizable()
//                            .frame(width: 15, height: 10)
////                            .foregroundColor(Color(.systemGray2))
//                            .foregroundColor(Color(.systemGray))
                        
                        Text("\(list.description)")
                            .font(.system(size: 14))
//                            .foregroundColor(Color(.systemGray2))
                            .foregroundColor(Color(.systemGray))
                    } // end of Hstack
                    
                }
            } // end of Vstack
            .padding(.leading,10)
            
            Spacer()
            
            Button {
                viewModel.deleteList(listId: list.documentID ?? "")
            } label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.gray)
                    .frame(width: 22, height: 22)
            }
            
        } // end of Hstack
        .padding(20)
        .frame(width: UIScreen.main.bounds.size.width - 25, height: 70)
        .background(Color("Purple"))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(list: list01, viewModel: ListViewModel())
    }
}
