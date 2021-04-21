//
//  LoginView.swift
//  pizza (iOS)
//
//  Created by Vinay Singh on 28/03/21.
//

import SwiftUI

struct LoginView: View {
    @Binding var login:Bool
    
    
    var body: some View{
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Login/Register")
                        
                        .foregroundColor(Color(UIColor(cgColor: CGColor(red: 212/255, green: 139/255, blue: 139/255, alpha: 1))))
                        .font(.largeTitle)
                        .shadow(radius: 20)
                        .padding()
                    
                }
                
                Image("eating")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.black)
                
                Button(action: {
                    withAnimation { 
                        self.login.toggle()
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .circular)
                            
                            .frame(width: 230, height: 69, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(UIColor(cgColor: CGColor(red: 212/255, green: 139/255, blue: 139/255, alpha: 1))))
                        
                        
                        Text("Login")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                })
                    .padding(.top,100)
                
                
                Button(action: {
                    
                    withAnimation {
                        self.login.toggle()
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .circular)
                            .frame(width: 230, height: 69, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(UIColor(cgColor: CGColor(red: 212/255, green: 139/255, blue: 139/255, alpha: 1))))
                        Text("Register")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    }
                })
                    .padding(.top,50)
                Spacer()
            }
        }
    }
}

