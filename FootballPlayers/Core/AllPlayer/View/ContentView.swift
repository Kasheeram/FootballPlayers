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
                    ForEach(viewModel.players) { player in
                        PlayerItemView(player: player)
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
