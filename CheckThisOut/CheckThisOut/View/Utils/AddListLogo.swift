//
//  AddListLogo.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 8/8/22.
//

import SwiftUI

struct AddListLogo: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
//                .background(colorScheme == .dark ? .clear : .black)
                .cornerRadius(80)
            
            Text("Add Your First List")
//                .background(colorScheme == .dark ? .clear : .black)
                .font(.system(size: 20))
                .fontWeight(.semibold)
        }
        
    }
}

struct AddListLogo_Previews: PreviewProvider {
    static var previews: some View {
        AddListLogo()
    }
}
