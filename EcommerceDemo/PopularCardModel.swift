//
//  PopularCardModel.swift
//  EcommerceDemo
//
//  Created by Ahmet OZBERK on 5.04.2022.
//

import Foundation

class PopularCardList: ObservableObject{
    @Published var item:[PopularCardModel] = [
        PopularCardModel(isSelected: true, title: "Headphone", image: "airpodpro.right"),
        PopularCardModel(isSelected: false, title: "Mobile", image: "iphone"),
        PopularCardModel(isSelected: false, title: "Mouse", image: "computermouse"),
        PopularCardModel(isSelected: false, title: "Keyboard", image: "keyboard"),
        PopularCardModel(isSelected: false, title: "MacBook", image: "desktopcomputer"),
    ]
}

class PopularCardModel: ObservableObject{
    @Published var isSelected:Bool?
    var title:String?
    var image:String?
    
    init(isSelected:Bool,title:String,image:String) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}
