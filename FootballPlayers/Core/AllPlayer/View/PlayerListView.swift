//
//  ContentView.swift
//  FootballPlayers
//
//  Created by kashee on 29/04/24.
//

import SwiftUI

struct PlayerListView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    @State private var fixtureId = "18535517"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.players) { player in
                        // card view for player with dependency injection
                        PlayerItemView(player: player)
                    }
                }
            }
            .overlay(
                Group {
                    // show loading view when fetching data from server
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(2.0, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    }
                }
            )
            .navigationTitle(APIURL.footballFixtures("").description)
        }
        .task {
            // call fetching data from server
            await viewModel.fetchPlayers(id: fixtureId)
        }
        .alert(isPresented: $viewModel.shouldShowError) {
            // show alert message when any error occured
            Alert(title: Text("Important message"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("Got it!")))
        }
    }
}

#Preview {
    PlayerListView()
}
