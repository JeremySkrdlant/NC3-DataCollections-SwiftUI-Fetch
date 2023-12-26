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
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    ForEach (activities){
                        activity in
                        NavigationLink {
                            ActivityDetailView(activity: activity)
                        } label: {
                            ActivityPreviewCard(activity: activity)
                        }
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
