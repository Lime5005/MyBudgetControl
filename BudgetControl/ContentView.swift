//
//  ContentView.swift
//  BudgetControl
//
//  Created by Liping Mechling on 21/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var totalBudegt = ""
    @State private var savingGoal = ""
    @State private var usedToday = ""
    
    //computed property
    var totalLeft: Double {
        let budgetAmount = Double(totalBudegt) ?? 0
        let controlGoal = Double(savingGoal) ?? 0
        let howMuchUsed = Double(usedToday) ?? 0
        
        let totalLeft = budgetAmount - controlGoal - howMuchUsed
        
        return totalLeft
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Total budget:")) {
                    TextField("Enter your total budget for this month", text: $totalBudegt)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Saving goal:")) {
                    TextField("Enter your saving goal for this month",
                              text: $savingGoal)
                        .keyboardType(.decimalPad)
                    
                }
                
                Section(header: Text("How much I just used:")) {
                    TextField("Enter the amount just used",
                              text: $usedToday)
                        .keyboardType(.decimalPad)
                    
                }
                
                //How to remember the last time input?
                Section(header: Text("How much left:")) {
                    Text("\(totalLeft, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("My Budget Control")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
