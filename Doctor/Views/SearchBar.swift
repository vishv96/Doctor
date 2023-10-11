//
//  SearchView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-08.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var presentSearch: Bool
    @FocusState var isFocuesd
    var filterAction: () -> Void
    
    var body: some View {
        HStack {
            // MARK: - Icon
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("", text: $text)
                .focused($isFocuesd)
                .onTapGesture {
                    presentSearch = true
                }
                
            Spacer()
            //MARK: - Filter button
            Button(action: {
                filterAction()
            }, label: {
                VStack {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(9)
                    
                }
                .background(Color.accentColor)
            })
            .clipShape(Circle())
            .padding(8)

        }
        .background(Color.white)
        .frame(height: 50)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .circular))
        .onAppear{
            isFocuesd = presentSearch
        }
        
    }
}

#Preview {
    SearchBar(text: .constant(""), presentSearch: .constant(false)){}
        .previewLayout(.sizeThatFits)
}

struct Searchpreview: PreviewProvider {
    static var previews: some View {
        VStack {
            SearchBar(text: .constant(""),presentSearch: .constant(false)){}.padding()
        }
        .background(Color("primary"))
        .previewLayout(.sizeThatFits)
    }
}
