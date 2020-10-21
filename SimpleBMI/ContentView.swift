//
//  ContentView.swift
//  SimpleBMI
//
//  Created by Pathompong Phongsaporamut on 21/10/2563 BE.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    
    @State var resultText:String = "A Simple BMI Calculator"
    @State var weight:String = ""
    @State var height:String = ""
    
    var body: some View {
        VStack {
            Text(resultText)
                .multilineTextAlignment(.center)
                .padding()
                .font(.largeTitle)
            
            HStack {
                Text("Weight")
                TextField("Kilograms", text: $weight)
                    .keyboardType(.numberPad)
            }.padding()
            
            HStack {
                Text("Height")
                TextField("Centimeters", text: $height)
                    .keyboardType(.numberPad)
            }.padding()
            
            Button(action: {
                
                self.endEditing()
                
                if (weight == "" || height == "") {
                    
                    resultText = "Please enter both Weight and Height"
                    
                } else {
                    
                    let result = Double(weight)! / pow((Double(height)!/100.0), 2)
                    
                    
                    resultText = "Your BMI\n" + String(format: "%.2f", result)
                    
                }
                
            }) {
                Text("Calculate")
            }.padding()
        }.padding()
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
