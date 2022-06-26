//
//  Home.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        NavigationView {
            VStack {
                if self.status {
                    HomeScreen()
                } else {
                    ZStack {
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            Text("")
                        }
                        .hidden()
                        
                        Login(show: $show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { _ in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
