//
//  CartView.swift
//  pizza (iOS)
//
//  Created by Vinay Singh on 07/04/21.
//

import SwiftUI

struct CartView: View {
    @State private var checked: Bool=false
    @State private var checkedDine: Bool=false
    @Binding var model:[ItemModel]
    @State var totalCart = 0
    @Binding var total:Int
    @State var ite=0
    
    var body: some View {
        ZStack{
            Color(red: 236/255, green: 233/255, blue: 200/255)
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("My Order")
                        .font(.title)
                        .frame(width: 340, height: 50, alignment: .center)
                        .padding()
                Spacer()
                }
                ScrollView( showsIndicators: false, content: {
                    ForEach(model.indices, id:\.self){mm in
                        
                        if(!(model[mm].quantity==0)){
                            Rectangle()
                                .frame(width: 340, height: 0.4, alignment: .center)
                                .foregroundColor(.gray)
                            HStack{
                                Image(model[mm].image_name)
                                    .resizable()
                                    .scaledToFit()
                                .padding(.leading,10)
                                .frame(width:130,height: 130)
                                Text(String(model[mm].quantity))
                                    .padding(.leading,10)
                                Text("x")
                                    
                                Text(model[mm].name)
                                    .font(.callout)
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .frame(width: 90, height: 30)
                                    HStack{
                                        Button(action: {
                                            model[mm].decre()
                                            total = total-model[mm].price
                                        }, label: {
                                            Image(systemName: "minus")
                                            
                                            .foregroundColor(.white)
                                            .font(.callout)
                                        })
                                        .frame(height:30)
                                        
                                    
                                        Button(action: {
                                            model[mm].incre()
                                            total = total+model[mm].price
                                        }, label: {
                                            Image(systemName: "plus")
                                                .padding()
                                                .foregroundColor(.white)
                                                .font(.callout)
                                        })
                                        .frame(height:30)
                                        .padding(.trailing,-10)
                                    
                                        
                                            
                                        
                                    }
                                    
                                }
                                .shadow(radius: 10)
                                
                                Spacer()
                                
                                
                            
                            }
                            .frame(width:.infinity,height: 130)
                    
                        }
                    }
                })
                Spacer()
                
                HStack {
                    
                    Group{
                            if checked {
                                ZStack{
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 20, height: 20)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 8, height: 8)
                                }.onTapGesture {self.checked = false;self.checkedDine = true;}
                            } else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 20, height: 20)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    .onTapGesture {self.checked = true;self.checkedDine = false;}
                            }
                    }
                    Text("Dine-in")
                        .padding()
                    Group{
                            if checkedDine {
                                ZStack{
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 20, height: 20)
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 8, height: 8)
                                }.onTapGesture {self.checkedDine = false; self.checked=true;}
                            } else {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 20, height: 20)
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    .onTapGesture {self.checkedDine = true;self.checked=false}
                            }
                    }
                    Text("Pick-up")
                        .padding()
                }
                Text("$"+String(total))
                    .bold()
                    .font(.largeTitle)
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 200, height: 100, alignment: .center)
                        Image(systemName: "applelogo")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .padding(.trailing,50)
                    Text("Pay")
                        .font(.title)
                        .padding(.leading,60)
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.top,-30)

    }
    
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        //
//    }
//}
