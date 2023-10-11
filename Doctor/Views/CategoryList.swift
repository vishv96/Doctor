//
//  SpecilaizationListView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import SwiftUI

struct CategoryList: View {
    
    let categories: [Category]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(categories) { category in
                    CatergoryCellView(category: category)
                }
            }
        }
    }
}


struct CatergoryCellView: View {
    let category: Category
    
    var body: some View {
        HStack {
            Spacer(minLength: 16)
            VStack {
                VStack{
                    if let url = URL(string: category.icon){
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image(systemName: "photo.artframe.circle.fill")
                                .resizable()
                                .scaledToFill()
                        }

                            
                    }
                }
                .padding(16)
                .frame(width: 80, height: 80)
                .background(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text(category.name)
                    .fontWeight(.semibold)
            }
        }
        
    }
}

#Preview {
    ZStack{
        Color("primary")
            .edgesIgnoringSafeArea(.all)
        CategoryList(categories: [.init(id: 1, name: "Kidney", icon: "https://t3.ftcdn.net/jpg/02/18/10/82/360_F_218108251_EcC0yKFHcVvdt15y4PXlJHPGodP0BjUF.jpg")])
    }
}
