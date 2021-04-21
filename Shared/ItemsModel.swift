//
//  ItemsModel.swift
//  pizza
//
//  Created by Vinay Singh on 26/03/21.
//

import Foundation


struct ItemModel: Identifiable {
    let id = UUID()
    var name:String
    var image_name:String
    var quantity:Int
    var price:Int
    
    mutating func incre() {
        if(quantity==0){
            quantity=0
        }
        else{
            quantity+=1
        }
    }
    mutating func decre() {
        if(quantity==0){
            quantity=0
        }
        else{
            quantity-=1
        }
    }
}
