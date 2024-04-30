//
//  PlayerItemView.swift
//  FootballPlayers
//
//  Created by kashee on 30/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlayerItemView: View {
    let player: PlayerCellViewModel
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                WebImage(url: URL(string: player.imagePath))
                    .resizable()
                    .frame(width: 100, height: 120)
                VStack(alignment: .leading, spacing: 4) {
                    Text(player.displayName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("\(AppConstant.dob): \(player.dateOfBirth ?? "")")
                        .font(.footnote)
                    Text("\(AppConstant.gender): \(player.gender)")
                        .font(.footnote)
                        
                }
                Spacer()
            }
                
        }
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(10)
        .shadow(radius: 20)
        .opacity(0.9)
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

#Preview {
    PlayerItemView(player: PlayerCellViewModel(player: Player(id: 1, name: "Kashee", displayName: "K. Kushwaha", dateOfBirth: "08/07/1991", gender: "Male", imagePath: "")))
}
