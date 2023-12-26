//
//  AddActivityView.swift
//  NC3-Data-Final-Sample
//
//  Created by admin on 12/26/23.
//

import SwiftUI

struct AddActivityView: View {
    var onSubmit:([Activity])->Void
    var imageURL = "https://www.nwktc.edu/assets/images/staff/2018_Jeremy_Skrdlant_1.jpg"
    @State var title = ""
    @State var description = ""
    @State var timeToComplete =  ""
    @State var competencies  = ""
    @State var toolsNeeded = ""
    @State var canSubmit = true;
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $description)
            TextField("Time to Complete in Minutes", text:$timeToComplete)
            TextField("Competencies seperated by comma", text: $competencies)
            TextField("Tools seperatec by comma", text: $toolsNeeded)
            Button(action: {
                //get arrays
                let competencyArray = competencies.split(separator: ",").map{item in String(item)}
                let toolsArray = toolsNeeded.split(separator: ",").map{item in String(item)}
                guard let time = Int(timeToComplete) else {
                    print("Error Need to handle this.")
                    return
                }
                
                let newActivity = Activity(title: title, timeToComplete: time, description: description, competencies: competencyArray, toolsNeeded: toolsArray, imageURL: imageURL)
                
                Task{
                  let result = try await  submitNew(activity: newActivity)
                    onSubmit(result)
                    dismiss()
                }
                
                
            }, label: {
                Text("Submit")
            }).buttonStyle(.borderedProminent)
                .disabled(!canSubmit)
                .padding(.top, 20)
                
        }.formStyle(.grouped)
        
    }
}

#Preview {
    AddActivityView{
        activities in
    }
}
