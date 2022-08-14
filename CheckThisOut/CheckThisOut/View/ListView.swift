//
//  ListView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct ListView: View {
    
    var list: CheckList
    
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        ZStack {
            HStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(list.title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    if list.description != "" {
                        HStack {

                            Text("\(list.description)")
                                .font(.system(size: 14))
                                .foregroundColor(Color.purple.opacity(0.7))
                        } // end of Hstack
                    }
                    
                    NavigationLink(
                        destination: OneListView(list: list)
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Task View")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.green)
                            }
                            .foregroundColor(.black)
                            .padding(.bottom,14)
                        }
                    )//end of Nav
                } // end of Vstack
                .padding(.leading,10)
                
                Spacer()
                
                Button {
                    viewModel.deleteList(listId: list.documentID ?? "")
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.purple)
    //                    .foregroundColor(Color(.black))
                        .frame(width: 22, height: 22)
                }
                
            } // end of Hstack

            .padding(15)
            .frame(width: UIScreen.main.bounds.size.width - 25, height: 90)
        .background(Color("Purple"))
        }
//        .border(.black, width: 4)
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(list: list01, viewModel: ListViewModel())
    }
}
