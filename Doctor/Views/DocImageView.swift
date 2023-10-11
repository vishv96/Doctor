//
//  DocImageView.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-10.
//

import SwiftUI

struct DocImageView: View {
    
    let id: Int
    let backgroundColor: Color
    let imageUrl: String
    let animation: Namespace.ID
    
    var body: some View {
        ZStack(alignment: .center){
            backgroundColor
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                   .matchedGeometryEffect(id: "\(id)-icon", in: animation)
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "person")
            }
            
        }
        .matchedGeometryEffect(id: "\(id)-icon-container", in: animation)
    }
}

#Preview {
    @Namespace var animation
    return DocImageView(id: 1, backgroundColor: .accent, imageUrl: "", animation: animation)
}
