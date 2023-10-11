//
//  SearchView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-10.
//

import SwiftUI

struct SearchView<T: View>: View {
    
    @Binding var searchText: String
    @Binding var presentSearch: Bool
    let searchAnimation: Namespace.ID
    @ViewBuilder var content: T
    
    var body: some View {
        VStack {
            if presentSearch {
                SearchBar(text: $searchText,
                          presentSearch: $presentSearch
                ) {}
                    .padding(.horizontal)
                    .matchedGeometryEffect(id: "searchbar", in: searchAnimation)
            }
            Spacer()
            content
        }
        .background(Color("primary"))
        
    }
}

#Preview {
    @Namespace var animation
    return SearchView(searchText: .constant(""),
                      presentSearch: .constant(true),
                      searchAnimation: animation){
        
    }
}
