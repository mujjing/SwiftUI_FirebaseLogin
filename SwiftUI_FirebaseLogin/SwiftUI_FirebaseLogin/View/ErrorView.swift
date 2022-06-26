//
//  ErrorView.swift
//  SwiftUI_FirebaseLogin
//
//  Created by 전지훈 on 2022/06/26.
//

import SwiftUI

struct ErrorView: View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                HStack {
                    Text(self.error == "RESET" ? "Message" : "Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                Text(self.error == "RESET" ? "입력하신 메일로 비밀번호 변경 메일이 발송되었습니다" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button {
                    self.alert.toggle()
                } label: {
                    Text(self.error == "RESET" ? "확인" : "취소")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var alert = true
//    static var error = "모든항목은 필수"
//    
//    static var previews: some View {
//        ErrorView(alert: alert, error: error)
//    }
//}
