//
//  SignUp.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI
import Firebase

struct SignUp: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                GeometryReader { _ in
                    VStack {
                        Image("j")
                        Text("회원가입")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack {
                            VStack {
                                if self.visible {
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)

                                } else {
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)

                                }
                            }
                            Button {
                                self.visible.toggle()
                            } label: {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }

                        }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack {
                            VStack {
                                if self.revisible {
                                    TextField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)

                                } else {
                                    SecureField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)

                                }
                            }
                            Button {
                                self.revisible.toggle()
                            } label: {
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }

                        }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        
                        Button {
                            self.register()
                        } label: {
                            Text("회원가입")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)

                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 50)
                }
                Button {
                    self.show.toggle()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func register() {
        if self.email != "" && self.pass != "" && self.repass != ""{
            if self.pass == self.repass {
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { res, err in
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("success")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            } else {
                self.error = "패스워드를 확인해 주세요"
                self.alert.toggle()
            }
        } else {
            self.error = "모든 항목은 필수입니다"
            self.alert.toggle()
        }
    }
}
