//
//  ItemsScrollView.swift
//  pizza
//
//  Created by Vinay Singh on 26/03/21.
//

import SwiftUI
import AlertToast
import Combine
struct ItemsScrollView:View {
    var items = ["1","2","3","4"]
    @State var showToast=false
    @Binding var it:[ItemModel]
    @Binding var isShowingDetailView: Bool
    @Binding var currectAddView:String
    @Binding var cartItemsSel:[ItemModel]
    @State var imageName="1"
    @Binding var total:Int
    @State var model:ItemModel = ItemModel(name: "", image_name: "", quantity: 0, price: 0)
    var body: some View{
        ScrollView(showsIndicators: false){
            VStack{
                
                ForEach(it){item in
                    NavigationLink(
                        destination: AddToCartView(model: $model, cartItemsSel: $cartItemsSel, total: $total),
                        isActive: $isShowingDetailView,
                        label: {
                            
                    Button(action: {
                        model = item
                        currectAddView=item.name
                        isShowingDetailView = true
                        imageName = item.image_name
                        
                    }){
                        
                            VStack {
                                HStack(spacing:10) {
                                    Image(item.image_name)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 130, height: 130)
                                                .padding(.leading,30)
                                                .shadow(radius: 10)
                                                .frame(height:130)
                                            VStack{
                                                Text(item.name)
                                                    
                                                    .font(.system(size: 18))
                                                    .bold()
                                                    .frame(width: 130, height: 30, alignment: .leading)
                                                
                                                ZStack {
                                                    Image(systemName: "clock")
                                                        .padding(.bottom,20)
                                                        .padding(.trailing,50)
                                                    Text("~ 15 min")
                                                        .font(.caption)
                                                        .bold()
                                                        .padding(.bottom,20)
                                                        .padding(.leading,20)
                                                    Capsule()
                                                        .frame(width: 100, height: 27)
                                                        .foregroundColor(.gray).opacity(0.4)
                                                        .padding(.bottom,20)
                                                }
                                                .padding(.trailing,30)
                                                
                                                
                                            
                                            }
                                            
                                            
                                            Spacer()
                                            
                                            VStack{
                                                
                                                Text("$"+String(item.price))
                                                    .bold()
                                                    .padding(.trailing,15)
                                                    .padding(.top,-20)
                                                    .font(.title2)
                                                
                                                Button(action: {
                                                    cartItemsSel.append(ItemModel(name: item.name, image_name: item.image_name, quantity: 1, price: item.price))
                                                    showToast.toggle()
                                                    total = total+(item.quantity*item.price)
                                                    
                                                }, label: {
                                                    ZStack{
                                                        
                                                        RoundedRectangle(cornerRadius:5)
                                                            .stroke(Color.black, lineWidth: 0.4)
                                                            .frame(width: 30, height: 30, alignment: .center)

                                                        Image(systemName: "plus")
                                                            .padding(5)
                                                            .font(.title3)
                                                            .foregroundColor(.black)
                                                        
                                                    }
                                                    .padding(.trailing,8)
                                                })
                                                
                                            }
                                            
                                            
                                        }
                                .padding(5)
                                
                            }
                        
                    }
                    .padding(.top,6)
                    }
                    
                    )
                    .buttonStyle(PlainButtonStyle())
                        
                }
                .buttonStyle(PlainButtonStyle())
            }
            .background(Color.white)
            
        }
        .cornerRadius(40)
        .toast(isPresenting: $showToast){

                    // `.alert` is the default displayMode
                    AlertToast(type: .regular, title: "Item Added")
                    
                    //Choose .hud to toast alert from the top of the screen
                    //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
                }

    }
    
    
}



struct ContentssView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




