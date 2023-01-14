//
//  ContentView.swift
//  SwiftUIElements
//
//  Created by Elena Mikhailova on 14.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var displayedName = ""
    @State private var userName = ""
    @State private var alertPresented = false
    
    
    var body: some View {
        VStack (spacing: 40) {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            
            UserNameView(userName: displayedName)
            
            ColorSliderView(value: $sliderValue, textColor: .red)
            
            TextField("Enter your name", text: $userName)
//                .textFieldStyle(.roundedBorder)
                .bordered()
               
            
            Button("Done", action: checkUserName)
                .alert("Wrong Format", isPresented: $alertPresented, actions: {} )
            {
                Text("Enter your name")
            }
            
            Text("Welcome to SwiftUI!")
                .font(.system(size: 60))
                .bold()
                .foregroundColor(.red)
               
            
                
            
            Spacer()
        }
        .padding()
    }
    private func checkUserName() {
        if let _ = Double(userName) {
            userName = ""
            alertPresented.toggle()
            return
        }
        displayedName = userName
        userName = ""
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color
    
    var body: some View {
        HStack{
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
                .background(.red)
                .cornerRadius(40)
            Text("255")
                .foregroundColor(textColor)
            
        }
    }
}

struct UserNameView: View {
    let userName: String
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline) {
                Text("User name: ").frame(height: 60)
                Text(userName)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}

struct BorderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: .gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}
extension TextField {
    func bordered() -> some View {
        modifier(BorderViewModifier())
    }
}
