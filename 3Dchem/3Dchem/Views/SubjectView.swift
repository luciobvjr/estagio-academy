//
//  SubjectView.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 03/05/22.
//

import SwiftUI

struct SubjectView: View {
    let title: String
    let text: String
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text(text)
                        .padding()
                    Spacer()
                }
                
                MyButton()
            }
        }
        .navigationTitle(Text(title))
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct MyButton: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 46, alignment: .center)
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding([.leading, .trailing])
            
            Text("Load 3D model")
                .foregroundColor(Color.white)
                .font(.system(size: 20))
        }
        .padding(.bottom)
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(title: "Geometria molecular",
                    text: "Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. Second line of text in here for this text element or component. ")
    }
}
