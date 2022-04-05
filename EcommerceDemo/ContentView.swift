//
//  ContentView.swift
//  EcommerceDemo
//
//  Created by Ahmet OZBERK on 5.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ size in
            VStack{
                AppBar()
                ScrollView(Axis.Set.vertical, showsIndicators: false){
                    VStack(alignment: .leading){
                        SliderCard(size: size)
                        Text("Popular Category")
                            .fontWeight(.bold)
                            .padding(.horizontal,24)
                            .padding(.bottom,10)
                            .font(.title2)
                        PopularCategoryWidget()
                        ForEach( 0..<5, id: \.self){ index in
                            ProductCard(size: size).padding(.horizontal,24).padding(.top,10)
                        }
                    }
                }
            }
        }
    }
}

struct ProductCard: View {
    var size:GeometryProxy
    var body: some View {
        HStack{
            Image("headphones_image")
                .resizable()
                .frame(width: 100, height: 105)
                .padding(.horizontal,5)
                .padding(.vertical,10)
                .background(Color.pink.opacity(0.1))
                .cornerRadius(20)
            VStack{
                HStack{
                    Text("Bose QC-700")
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "heart")
                        .frame(width: 35, height: 35)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2),radius: 3)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.white))
                        
                }
                Text("Over Ear, Wireless Bluetooth Headphones with Buildt-In Microphone")
                    .font(.subheadline)
                    .foregroundColor(Color.black.opacity(0.7))
                HStack{
                    Text("$379.00")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    Spacer()
                    Text("Buy")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .frame(width: 80, height: 30)
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 0.5).foregroundColor(Color.white))
                        
                }
            }
        }.padding(15)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
    }
}

struct PopularList: View {
    var item:PopularCardModel?
    var body: some View {
        HStack{
            Image(systemName: item?.image ?? "")
                .foregroundColor((item?.isSelected ?? true) ? Color.white : Color.black)
            Text(item?.title ?? "")
                .foregroundColor((item?.isSelected ?? true) ? Color.white : Color.black)
        }.padding(10)
            .background((item?.isSelected ?? true) ? Color.red : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke((item?.isSelected ?? true) ? Color.red : Color.gray, lineWidth: 0.6)
            )
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopIcon: View {
    var imageName:String = ""
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 25, height: 25)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.4)
            )
    }
}

struct AppBar: View {
    var body: some View {
        HStack{
            TopIcon(imageName: "magnifyingglass")
            Spacer()
            ZStack {
                TopIcon(imageName: "bell")
                Text("3")
                    .font(.custom("", fixedSize: 12))
                    .foregroundColor(Color.white)
                    .frame(width: 20, height: 20)
                    .background(Color.red)
                    .cornerRadius(5)
                    .offset(x: 20, y: -20)
            }
        }.padding(.horizontal,24)
    }
}

struct SliderCard: View {
    var size : GeometryProxy
    var body: some View {
            ZStack {
                VStack(alignment: .leading){
                    Text("Music and No more")
                        .font(.custom("", size: 24))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                    Text("10% off for One of the best headphones in the world")
                        .foregroundColor(Color.white.opacity(0.9))
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.custom("", size: 15))
                        .padding(.bottom,7)
                        .padding(.top,1)
                        .padding(.trailing,size.size.width*0.3)
                    
                    HStack{
                        Text("Order Now")
                            .font(.custom("", size: 20))
                            .fontWeight(.bold)
                        Image(systemName: "chevron.right")
                    }.padding(12)
                        .background(Color.white)
                        .cornerRadius(15)
                }.padding(20)
                    .background(Color.red)
                    .cornerRadius(20)
                    .padding(20)
                    .frame(width: size.size.width)
                Image("headphones_image")
                    .resizable()
                    .frame(width: size.size.width*0.5, height: size.size.width*0.5)
                    .offset(x: size.size.width*0.25, y: size.size.width*0.08)
            }
    }
}

struct PopularCategoryWidget: View {
    @StateObject var popularCategory = PopularCardList()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<popularCategory.item.count,id: \.self){ index in
                    PopularList(item: popularCategory.item[index])
                        .onTapGesture {
                            changeToggleCategory(index: index)
                        }
                }
            }.padding(.horizontal,24)
        }
    }
    
    func changeToggleCategory(index:Int){
        popularCategory.item.forEach { model in
            model.isSelected = false
        }
        let item = popularCategory.item[index]
        item.isSelected?.toggle()
    }
}
