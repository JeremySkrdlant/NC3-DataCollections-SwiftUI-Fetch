//
//  ContentView.swift
//  NC3-Data-Final-Sample
//

import SwiftUI

struct ContentView: View {
    @State var activities:[Activity] = []
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 120)), GridItem(.flexible(minimum: 120))], content: {
                    ForEach (activities){
                        activity in
                        ActivityPreviewCard(activity: activity)
                    }
                })
                .toolbar(content: {
                    NavigationLink {
                        AddActivityView{
                            result in
                            activities = result
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                    }

                })
                .padding()
                .onAppear{
                    Task{
                        activities = try await getAllActivities()
                        print(activities)
                    }
            }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
