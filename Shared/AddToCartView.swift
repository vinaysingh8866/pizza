//
//  AddToCartView.swift
//  pizza
//
//  Created by Vinay Singh on 26/03/21.
//

import SwiftUI

struct AddToCartView:View {
    var items = ["cheese","pomagranate","watermelon"]
    @Binding var model:ItemModel
    @Binding var cartItemsSel:[ItemModel]
    @Binding var total:Int
    var body: some View{
        ZStack{
            Color(red: 236/255, green: 233/255, blue: 200/255)
                .ignoresSafeArea()
            VStack{
                    ZStack{
                        Image(model.image_name)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                    .frame(width: .infinity, height: 350)
    
                    ZStack{
                        Color(red: 216/255, green: 213/255, blue: 170/255)
                        
                        VStack{
                        
                            HStack{
                                Text(model.name)
                                    .bold()
                                    .padding(.top, 30)
                                    .padding(.leading, 20)
                                    .font(.title)
                                
                                
                                Spacer()
                                }
                            
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                        .frame(width: 100, height: 35)
                                        .cornerRadius(5)
                                        
                                    HStack{
                                        Button(action: {
                                            model.quantity-=1
                                        }, label: {
                                            Image(systemName: "minus")
                                                .font(.body)
                                                .foregroundColor(.black)
                                                
                                        })
                                        Divider()
                                            .frame(height: 16, alignment: .center)
                                            .padding(0.4)
                                            .foregroundColor(.green)
                                        Text(String(model.quantity))
                                            .bold()
                                            .padding(0.4)
                                            
                                        
                                        
                                            
                                        Button(action: {
                                            model.quantity+=1
                                        }, label: {
                                            Divider()
                                                .frame(height: 16, alignment: .center)
                                            Image(systemName: "plus")
                                                .font(.body)
                                                .foregroundColor(.black)
                                        })
                                    }
                                }
                                    .padding(.leading,20)
                                Spacer()
                                Text(String(model.price))
                                    .bold()
                                    .padding()
                                    .font(.title)
                            }
                            HStack{
                                
                                Text("Sides")
                                    .font(.headline)
                                    .padding(.leading, 20)
                                Spacer()
                                
                            }
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack {
                                    ForEach(items, id:\.self){it in
                                        
                                        Button(action: {}, label: {
                                            VStack {
                                                Image(it)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 110, height: 90, alignment: .center)
                                                Text(it)
                                                    
                                                    .bold()
                                                    .accentColor(.black)
                                                    
                                            }
                                            .frame(width: 120, height: 150, alignment: .center)
                                            .background(Color.white)
                                            .cornerRadius(10, antialiased: true)
                                            
                                        })
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                                .padding(.leading,20)
                            
                            
                            
                            Spacer()
                            Button(action: {
                                cartItemsSel.append(ItemModel(name: model.name, image_name: model.image_name, quantity: model.quantity, price: model.price))
                                total = total+(model.quantity*model.price)
                            }, label: {
                                Text("Add to Cart")
                                    .foregroundColor(.black)
                                    .bold()
                                
                            })
                                .frame(width: 200, height: 60, alignment: .center)
                                
                                .background(Color( red: 221/255, green: 113/255, blue: 64/255, opacity: 255))
                                .cornerRadius(10)
                                .padding(.bottom, 100)
                        
                        }
                    }
                    .cornerRadius(20)
                    .padding(.top, 10)
                    .ignoresSafeArea()
                
                
                
                
                
            }
        
        }
    }
}

