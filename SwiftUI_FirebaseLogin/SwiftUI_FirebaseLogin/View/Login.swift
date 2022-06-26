//
//  Login.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI
import Firebase

struct Login: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topTrailing) {
                GeometryReader { _ in
                    VStack {
                        Image("j")
                        Text("로그인 해주세요")
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
                            Spacer()
                            
                            Button {
                                self.reset()
                            } label: {
                                Text("비밀번호를 잊어버리신 분")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        Button {
                            self.verify()
                        } label: {
                            Text("로그인")
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
                    Text("회원가입")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    func verify() {
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
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
            self.error = "모든 항목은 필수 입니다"
            self.alert.toggle()
        }
    }
    
    func reset() {
        if self.email != "" {
            Auth.auth().sendPasswordReset(withEmail: self.email) { err in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                self.error = "RESET"
                self.alert.toggle()
            }
        } else {
            self.error = "이메일란을 입력해주세요"
            self.alert.toggle()
        }
    }
}
