//
//  GreetingCardView.swift
//  NutritionScannerApp
//
//  Created by Priya Srivastava on 21/01/25.
//

import SwiftUI

struct GreetingCardView: View {
    let userProfile: UserProfile
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: userProfile.profileImageURL)) { result in
                result.image?
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(40)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text(userProfile.greeting)
                    .font(.title)
                    .bold()
                Text(userProfile.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct GreetingsCardView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingCardView(userProfile: UserProfile(
            profileImageURL: "https://picsum.photos/id/237/300/300",
            greeting: "Good Morning",
            subtitle: "Track nutrition, stay healthy"
        ))
    }
}
