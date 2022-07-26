//
//  LogoView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        
        VStack {
            Image("LoginLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text("Check This Out!")
                .font(.system(size: 25))
                .fontWeight(.bold)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            LogoView()
        }
    }
}
