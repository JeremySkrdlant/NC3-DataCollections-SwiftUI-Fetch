//
//  ActivityPreviewCard.swift
//  NC3-Data-Final-Sample
//
//  Created by admin on 12/26/23.
//

import SwiftUI

struct ActivityPreviewCard: View {
    var activity:Activity
    
    var body: some View {
        
        VStack {
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
            Text(activity.title)
                .bold()
            Spacer()
        }
        .frame(width: 120, height: 200)
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        .padding(1)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        
    }
}

#Preview {
    ActivityPreviewCard(activity: Activity( title: "SwiftUI Intro, An extensive study", timeToComplete: 30, description: "Introduction to SwiftUI", competencies: ["Stacks", "Images", "Text", "Modifiers"], toolsNeeded: ["Xcode"], imageURL: "https://www.nwktc.edu/assets/images/staff/2018_Jeremy_Skrdlant_1.jpg"))
}
