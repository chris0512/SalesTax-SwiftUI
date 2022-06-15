//
//  ContentView.swift
//  SalesTax-SwiftUI
//
//  Created by Yang Chi on 2022/6/14.
//

import SwiftUI

struct ContentView: View {
    
    @State var beforeTaxPrice = ""
    @State var salesTaxRate = ""
    @State var afterTaxPrice = ""
    
    var body: some View {
        VStack {
            Text("Sales Tax Calculator")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            HStack {
                Text("Berfore Tax Price")
                TextField("$0", text: $beforeTaxPrice)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 40.0)
            
            HStack {
                Text("Sales Tax Rate")
                TextField("3.7%", text: $salesTaxRate)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 20.0)
            
            HStack {
                Text("After Tax Price")
                TextField("$0", text: $afterTaxPrice)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 20.0)
            
            Button("Calculate") {
                if let beforeTax = Float(beforeTaxPrice),
                   let tax = Float(salesTaxRate) {
                    let salesTax = beforeTax * tax / 100
                    afterTaxPrice = String(beforeTax + salesTax)
                }
            }
            .padding(.top, 40)
            
            Spacer()
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
