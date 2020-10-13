//
//  ScreenCover.swift
//  Break Timer
//
//  Created by Coding on 10/12/20.
//

import SwiftUI

struct ScreenCover: View {
    @State private var isPresented = false
        var body: some View {
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .foregroundColor(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        ScreenCover()
    }
}
