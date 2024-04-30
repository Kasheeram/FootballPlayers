//
//  ContentView.swift
//  FootballPlayers
//
//  Created by kashee on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PlayerViewModel()
    @State private var fixtureId = "18535517"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.playerLineups) { player in
                        VStack {
                            HStack(spacing: 4) {
                                Image("kashee")
                                    .resizable()
                                    .frame(width: 100, height: 120)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(player.player.displayName ?? "")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text("DOB: \(player.player.dateOfBirth ?? "")")
                                        .font(.footnote)
                                    Text("Gender: \(player.player.gender ?? "")")
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
                .navigationTitle(APIURL.footballFixtures("").description)
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(2.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    
                }
            }
        }
        .task {
            await viewModel.fetchPlayers(id: fixtureId)
        }
        .alert(isPresented: $viewModel.shouldShowError) {
            Alert(title: Text("Important message"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("Got it!")))
        }
    }
}

#Preview {
    ContentView()
}
