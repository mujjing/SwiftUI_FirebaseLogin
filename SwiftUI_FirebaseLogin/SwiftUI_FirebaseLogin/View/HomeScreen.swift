//
//  HomeScreen.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI
import Firebase

struct HomeScreen: View {
    var body: some View {
        VStack {
            Text("로그인이 되었습니다")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Button {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)

            } label: {
                Text("로그아웃")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
