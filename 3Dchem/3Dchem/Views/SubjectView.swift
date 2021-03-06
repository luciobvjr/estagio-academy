//
//  SubjectView.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import SwiftUI

struct SubjectView: View {
    let title: String
    let texts: [String]
    let images: [String]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1...texts.count, id: \.self) { index in
                    
                    Text(texts[index-1])
                        .font(.body)
                    
                    if images.count >= index {
                        VStack(spacing: -20) {
                            Image(images[index-1])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 0, height: 300)
                            
                            NavigationLink(destination: ARViewContainer()) {
                                MyButton()
                            }
                        }
                    }
                }
                    .padding()
            }
        }
        .navigationTitle(Text(title))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }
        }
    }
}

struct MyButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 36, alignment: .center)
                .foregroundColor(Color(uiColor: UIColor(.primary)))
                .cornerRadius(20)
                .padding([.leading, .trailing])
            
            Text("Load 3D model")
                .foregroundColor(Color(uiColor: UIColor.systemBackground))
                .font(.body)
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(title: "Geometria molecular",
                    texts: ["1","2"],
                    images: ["dalton", "thomson"])
    }
}
