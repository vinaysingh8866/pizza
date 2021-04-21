//
//  SelectionBarView.swift
//  pizza
//
//  Created by Vinay Singh on 26/03/21.
//

import SwiftUI

struct SelectionBarView: View {
    
    @Binding var it:[ItemModel]
    @Binding var pizzaModel:[ItemModel]
    @Binding var burgerModel:[ItemModel]
    @Binding var drinksModel:[ItemModel]
    @Binding var allModel:[ItemModel]
    
    
    @State private var selectedBurger=false
    @State private var selectedPizza=true
    @State private var selectedDrinks=false
    @State private var selectedAll=false
    var body: some View{
        
        HStack(spacing:30){
            
            Button(action: {
                withAnimation(.easeInOut){
                it=allModel
                }
            withAnimation(.default) {
                selectedBurger=false
                selectedAll=true
                selectedPizza=false
                selectedDrinks=false
            }
            }, label: {
                SelectionButtonView(selected: $selectedAll, image: "fast-food", name: "All")
            }).buttonStyle(PlainButtonStyle())
            
            
            
            
            Button(action: {
                withAnimation(.easeInOut) {
                    it=pizzaModel
                     }
                
                withAnimation(.default) {
                    selectedBurger=false
                    selectedAll=false
                    selectedPizza=true
                    selectedDrinks=false
                }

            }, label: {
                SelectionButtonView(selected: $selectedPizza, image: "pizza", name: "Pizza")
            }).buttonStyle(PlainButtonStyle())
            
            
            
            Button(action: {
                withAnimation(.easeInOut) {
                    it=burgerModel
                    
                }
                withAnimation(.default) {
                    selectedBurger=true
                    selectedAll=false
                    selectedPizza=false
                    selectedDrinks=false
                }
            }, label: {
                
                SelectionButtonView(selected: $selectedBurger, image: "burger",name:"Burger")
                
            
            }).buttonStyle(PlainButtonStyle())
            
            
            
            Button(action: {
                withAnimation(.easeInOut) {
                    it=drinksModel
                }
                withAnimation(.default) {
                selectedBurger=false
                selectedAll=false
                selectedPizza=false
                selectedDrinks=true
                }
            }, label: {
                SelectionButtonView(selected: $selectedDrinks, image: "drink", name: "Drinks")
            }).buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}



struct SelectionButtonView:View {
    @Binding var selected:Bool
    var image:String
    var name:String
    var body: some View{
        if selected{
            VStack {
            Image(image)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .padding()
            Text(name)
                .bold()
            }
            .background(Color(red: 236/255, green: 233/255, blue: 200/255))
            .shadow(radius: 5)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        
    
    else{
        VStack {
        Image(image)
            
            .resizable()
            .frame(width: 60, height: 60, alignment: .center)
            .padding(.all,2)
        Text(name)
            .bold()
        }
        .shadow(radius: 5)
        }
        
    }
}


struct ContentView_44Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
