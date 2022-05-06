//
//  BackButton.swift
//  3Dchem
//
//  Created by Lucio Bueno Vieira Junior on 06/05/22.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button (action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing:0) {
                Image(systemName: "chevron.left")
                Text("Voltar")
            }
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
