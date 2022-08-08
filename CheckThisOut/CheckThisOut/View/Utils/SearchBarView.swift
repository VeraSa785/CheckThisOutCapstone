//
//  SearchBarView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/7/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @State var isSearching = false
    
    var body: some View {
        
        HStack {
            TextField("Search Lists", text: $searchText)
                .searchTextFieldStyle()
                .onTapGesture (perform: {
                    isSearching = true
                })
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.black))
                        Spacer()
                        
                        if isSearching {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                        
                    }
                        .padding(.horizontal, 8)
                        .foregroundColor(.black)

                )
                .transition(.move(edge: .trailing))
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color(.black))
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
            }
        }
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            BackgroundView()
            SearchBarView(searchText: .constant(""))
        }
        
    }
}


struct SearchTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .padding(.leading, 20)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color(.white))
            .cornerRadius(15)
    }
}

extension View {
    func searchTextFieldStyle() -> some View {
        modifier(SearchTextFieldModifier())
    }
}
