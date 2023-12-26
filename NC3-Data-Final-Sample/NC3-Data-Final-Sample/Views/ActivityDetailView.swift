//
//  ActivityDetailView.swift
//  NC3-Data-Final-Sample
//
//  Created by admin on 12/26/23.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity:Activity
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment:.center) {
                AsyncImage(url: URL(string:activity.imageURL)!) { img in
                    img.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .shadow(radius: 5)
                } placeholder: {
                    Color.gray.clipShape(Circle())
                        .frame(width: 100, height: 100)
                }
                VStack (alignment:.leading) {
                    Text(activity.title)
                        .bold()
                    Text(activity.description)
                }.padding(.leading, 20)
            }
            Divider()
            Text("⏰ \(activity.timeToComplete) minutes")
            Text("Comptetencies")
                .font(.title)
                .padding(.top)
            ForEach(activity.competencies, id: \.self){
                comptency in
                Text("* \(comptency)")
            }
            
            Text("Tools Needed")
                .font(.title)
                .padding(.top)
            ForEach(activity.toolsNeeded, id: \.self){
                tool in
                Text("* \(tool)")
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    ActivityDetailView(activity: Activity( title: "SwiftUI Intro, An extensive study", timeToComplete: 30, description: "Introduction to SwiftUI", competencies: ["Stacks", "Images", "Text", "Modifiers"], toolsNeeded: ["Xcode"], imageURL: "https://www.nwktc.edu/assets/images/staff/2018_Jeremy_Skrdlant_1.jpg"))
}
