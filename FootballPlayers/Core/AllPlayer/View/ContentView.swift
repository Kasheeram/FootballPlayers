//
//  ContentView.swift
//  FootballPlayers
//
//  Created by kashee on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { player in
                        VStack() {
                            HStack(spacing: 4) {
                                Image("kashee")
                                    .resizable()
                                    .frame(width: 100, height: 120)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("K. Kushwaha")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text("DOB: 08/07/1991")
                                        .font(.footnote)
                                    Text("Gender: Male")
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
            }
        }
    }
}

#Preview {
    ContentView()
}
