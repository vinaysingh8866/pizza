//
//  ContentView.swift
//  Shared
//
//  Created by Vinay Singh on 21/03/21.
//

import SwiftUI

struct ContentView: View {
    @State var isPizza=true
    @State var it=[ItemModel(name: "Margherita", image_name: "1", quantity: 1, price: 12),ItemModel(name: "Pineapple", image_name: "2", quantity: 1, price: 24),ItemModel(name: "Capsicum", image_name: "3", quantity: 1, price: 11),ItemModel(name: "Margherita", image_name: "4", quantity: 1, price: 16)]
    
    @State var pizzaModel=[ItemModel(name: "Margherita", image_name: "1", quantity: 1, price: 14),ItemModel(name: "Pineapple Pizza", image_name: "2", quantity: 1, price: 14),ItemModel(name: "Capsicum", image_name: "3", quantity: 1, price: 13),ItemModel(name: "Margherita", image_name: "4", quantity: 1, price: 15)]
    
    @State var burgerModel = [ItemModel(name: "Cheeseburger", image_name: "burger1", quantity: 1, price: 9),ItemModel(name: "Margherita", image_name: "burger2", quantity: 1, price: 9),ItemModel(name: "HamBurger", image_name: "burger3", quantity: 1, price: 9),ItemModel(name: "Margherita", image_name: "burger4", quantity: 1, price: 10)]
    
    @State var drinksModel = [ItemModel(name: "Cheeseburger", image_name: "drink1", quantity: 1, price: 11),ItemModel(name: "Margherita", image_name: "drink2", quantity: 1, price: 12),ItemModel(name: "HamBurger", image_name: "drink3", quantity: 1, price: 14),ItemModel(name: "Margherita", image_name: "drink4", quantity: 1, price: 14)]
    
    @State var allModel = [ItemModel(name: "Margherita", image_name: "1", quantity: 1, price: 12),ItemModel(name: "Pineapple", image_name: "2", quantity: 1, price: 24),ItemModel(name: "Capsicum", image_name: "3", quantity: 1, price: 11),ItemModel(name: "Margherita", image_name: "4", quantity: 1, price: 16),ItemModel(name: "Margherita", image_name: "1", quantity: 1, price: 14),ItemModel(name: "Pineapple Pizza", image_name: "2", quantity: 1, price: 14),ItemModel(name: "Capsicum", image_name: "3", quantity: 1, price: 13),ItemModel(name: "Margherita", image_name: "4", quantity: 1, price: 15),ItemModel(name: "Cheeseburger", image_name: "burger1", quantity: 1, price: 9),ItemModel(name: "Margherita", image_name: "burger2", quantity: 1, price: 9),ItemModel(name: "HamBurger", image_name: "burger3", quantity: 1, price: 9),ItemModel(name: "Margherita", image_name: "burger4", quantity: 1, price: 10),ItemModel(name: "Cheeseburger", image_name: "drink1", quantity: 1, price: 11),ItemModel(name: "Margherita", image_name: "drink2", quantity: 1, price: 12),ItemModel(name: "HamBurger", image_name: "drink3", quantity: 1, price: 14),ItemModel(name: "Margherita", image_name: "drink4", quantity: 1, price: 14)]
    
    
    @State var isShowingDetailView = false
    @State var selection: Int? = nil
    @State var currectAddView:String=""
    @State var login = false
    @State var cartViewIsActive = false
    @State var total = 0
    var items = ["cheese","pomagranate","watermelon"]
    var pizza = ["1","2","3","4"]
    @State var cartItemsSel:[ItemModel]=[] 
    var body: some View {
        
        if login{
        
                NavigationView{
                    
                    ZStack {
                
                        Color(red: 236/255, green: 233/255, blue: 200/255)
                                .ignoresSafeArea()
                        
                        
                        
                            VStack{
                                
                                HStack{
                                    Spacer()
                                    
                                }
                                .padding(.top,-90)
                                .padding(.trailing)
                                
                            
                                
                                
                                HStack{
                                
                                    Text("Gandhidham, Kutch")
                                        .font(.headline)
                                        .padding(.leading,26)
                                    Image(systemName: "chevron.down")
                                    
                                    Spacer()
                                }
                                
                                SelectionBarView(it: $it, pizzaModel: $pizzaModel, burgerModel: $burgerModel, drinksModel: $drinksModel,allModel: $allModel)
                                
                                ItemsScrollView(it: $it, isShowingDetailView: $isShowingDetailView, currectAddView: $currectAddView, cartItemsSel: $cartItemsSel, total: $total)
                                    .ignoresSafeArea()
                                
                            }
                        }
                    
                    .navigationTitle("Jucifer")
                    .navigationBarItems(trailing: CartButton(cartViewIsActive: $cartViewIsActive, items: $cartItemsSel, total: $total))
                
                    }
                
        }
        
        else{
            LoginView(login: $login)
                .transition(.slide)
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
init(_ hex: Int, opacity: Double = 1.0) {
    let red = Double((hex & 0xff0000) >> 16) / 255.0
    let green = Double((hex & 0xff00) >> 8) / 255.0
    let blue = Double((hex & 0xff) >> 0) / 255.0
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
}
    
    
}


struct CartButton:View {
    @Binding var cartViewIsActive:Bool
    @Binding var items:[ItemModel]
    @Binding var total:Int
    var body: some View{
        NavigationLink(
            destination: CartView(model: $items, total: $total),
            isActive: $cartViewIsActive,
            label: {
                Button(action: {
                    cartViewIsActive=true
                }, label: {
                    
                    ZStack{
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(red: 236/255, green: 233/255, blue: 200/255))
                        .shadow(radius: 10)
                        .padding(.trailing, 10)
                        Image(systemName: "cart.fill")
                        .font(.system(size: 20))
                        .padding(.trailing,10)
                        .foregroundColor(.black)
                    }
                    
                })
            })
        
        
        
    }
}
