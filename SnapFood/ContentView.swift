//
//  ContentView.swift
//  SnapFood
//
//  Created by Ipung Dev Center on 23/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    @State var selectedBottomTab = 1

    var body: some View {
        
        ZStack{
            VStack{
                //MARK: TITLE
                HeadTitle()
                
                //MARK: TABS TOP
                TopTabs(selectedTab: self.$selectedTab)

                //MARK: Scrool FOOD
                ScrollFood()
                
                Spacer()
                //MARK: BOTTOm TABS
                BottomTabs(selectedBottomTab: self.$selectedBottomTab)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeadTitle: View {
    var body: some View {
        HStack {
            Text("Favorite").font(.system(size: 28, weight: .semibold, design: .default))
            Spacer()
        }.padding([.leading,.trailing], 30).padding(.bottom, 40)
    }
}

struct TopTabs: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing:0){
                    //MARK: TABS 1
                    VStack{
                        Button(action: {
                            self.selectedTab = 1
                            
                        }){
                            Text("All").font(.headline).foregroundColor(selectedTab == 1 ? Color.green : Color.secondary)
                        }
                        
                        
                        Rectangle().fill(Color.green).frame(height: 5).opacity(selectedTab == 1 ? 100:0)
                        
                    }.frame(height: 20)
                    
                    //MARK: TABS 2
                    
                    VStack{
                        Button(action: {
                            self.selectedTab = 2
                        }){ Text("Cookbooks").font(.headline).foregroundColor(selectedTab == 2 ? Color.green : Color.secondary)
                        }
                        Rectangle().fill(Color.green).frame(height: 5).opacity(selectedTab == 2 ? 100:0)
                    }.frame(height: 20)
                    
                    //MARK: TABS 3
                    VStack{
                        Button(action: {
                            self.selectedTab = 3
                        }){ Text("Recently").font(.headline).foregroundColor(selectedTab == 3 ? Color.green : Color.secondary)
                        }
                        Rectangle().fill(Color.green).frame(height: 5).opacity(selectedTab == 3 ? 100:0)
                    }.frame(height: 20)
                    
                    
                }
            }.padding(.bottom, 10).padding(.top, 25).border(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), width: 1)
        }.padding(.bottom, 30)
    }
}

struct ScrollFood: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                Food(imgfood: "deesert1", foodtitle: "Ice Cream", foodchef: "Jet Li")
                Food(imgfood: "deesert2", foodtitle: "Yummi Ice Cream", foodchef: "Andy Liu")
                Food(imgfood: "deesert3", foodtitle: "Mola Ice Cream", foodchef: "Jacky Chan")
                Food(imgfood: "deesert4", foodtitle: "Sad Ice Cream", foodchef: "Ip Man")
            }.padding([.leading,.trailing],30).padding(.bottom, 20)
            
        }
    }
}

struct BottomTabs: View {
    @Binding var selectedBottomTab : Int
    var body: some View {
        HStack(){
            
            VStack{
                Button(action: {
                    self.selectedBottomTab = 1
                }){
                    VStack{
                        Image(systemName: "heart.fill").resizable().frame(width: 25, height:23).foregroundColor(self.selectedBottomTab == 1 ? Color.green : Color.secondary)
                        Text("Favorite").font(.system(size: 9, weight: .medium, design: .default)).foregroundColor(self.selectedBottomTab == 1 ? Color.green : Color.secondary)
                    }
                    
                }
                
            }
            Spacer()
            
            VStack{
                Button(action: {
                    self.selectedBottomTab = 2
                }){
                    VStack{
                        Image(systemName: "magnifyingglass").resizable().frame(width: 25, height:23).foregroundColor(self.selectedBottomTab == 2 ? Color.green : Color.secondary)
                        Text("Search").font(.system(size: 9, weight: .medium, design: .default)).foregroundColor(self.selectedBottomTab == 2 ? Color.green : Color.secondary)
                    }
                    
                }
            }
            Spacer()
            VStack{
                Button(action: {
                    self.selectedBottomTab = 3
                }){
                    VStack{
                        Image(systemName: "camera").resizable().frame(width: 25, height:23).foregroundColor(self.selectedBottomTab == 3 ? Color.green : Color.secondary)
                        Text("Photo").font(.system(size: 9, weight: .medium, design: .default)).foregroundColor(self.selectedBottomTab == 3 ? Color.green : Color.secondary)
                    }
                    
                }
            }
            Spacer()
            VStack{
                Button(action: {
                    self.selectedBottomTab = 4
                }){
                    VStack{
                        Image(systemName: "cart").resizable().frame(width: 25, height:23).foregroundColor(self.selectedBottomTab == 4 ? Color.green : Color.secondary)
                        Text("Shopping").font(.system(size: 9, weight: .medium, design: .default)).foregroundColor(self.selectedBottomTab == 4 ? Color.green : Color.secondary)
                    }
                    
                }
            }
            Spacer()
            VStack{
                Button(action: {
                    self.selectedBottomTab = 5
                }){
                    VStack{
                        Image(systemName: "person").resizable().frame(width: 25, height:23).foregroundColor(self.selectedBottomTab == 5 ? Color.green : Color.secondary)
                        Text("Profile").font(.system(size: 9, weight: .medium, design: .default)).foregroundColor(self.selectedBottomTab == 5 ? Color.green : Color.secondary)
                    }
                    
                }
            }
            
        }.padding([.leading,.trailing], 30)
    }
}

struct Food: View {
    
    var imgfood : String = ""
    var foodtitle: String = ""
    var foodchef: String = ""
    
    var body: some View {
        VStack{
            Image(self.imgfood).resizable().aspectRatio(contentMode: .fill) .frame( height: 200).cornerRadius(20).clipped()
            
            HStack{
                Text("50 min").font(.headline)
                Text("234 cal").font(.headline)
                HStack{
                    Text("Rating").font(.headline)
                    HStack{
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                        Image(systemName: "star.fill").foregroundColor(Color.yellow)
                    }
                }
                Spacer()
            }.frame(height: 30)
            
            HStack{
                Image("profile").resizable().aspectRatio(contentMode: .fill).frame(width: 40, height: 40).clipShape(Circle())
                VStack(alignment: .leading){
                    Text(self.foodtitle).font(.system(size: 20, weight: .bold, design: .rounded))
                    Text(self.foodchef).font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(Color.secondary)
                }
                
                Spacer()
            }
            
        }.padding(.bottom, 20)
    }
}
