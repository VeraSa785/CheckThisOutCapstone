//
//  AllertPasswordView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/16/22.
//

//do not have time to implement

import SwiftUI

struct AllertPasswordView: View {
    
    @State var showAllertPasswordView = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Password should be at least 6 characters")
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 250,height: 50, alignment: .center)
                .padding(.bottom,2)
//                .frame(width: 290, alignment: .center)
//                        .border(Color.black, width: 3)
                .multilineTextAlignment(.center)
                .lineLimit(15)
            
            
            HStack {
                
                Button {
                    showAllertPasswordView = false
                } label: {
                    OkButton()
                }
            }
            .padding(.bottom,3)
            
            Spacer()
            
        }//end of Vstack
        .frame(width: UIScreen.main.bounds.size.width - 110, height: 140)
        .background(Color(.systemGray6))

    }
}

struct AllertPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AllertPasswordView()
    }
}

struct OkButton: View {
    var body: some View {
        Text("Ok")
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: 100, height: 40)
//            .background(Color.white.opacity(0.6))
            .background(Color("Yellow"))
            .clipShape(Capsule())
    }
}
