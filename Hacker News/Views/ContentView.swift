//
//  ContentView.swift
//  Hacker News
//
//  Created by Janet Van on 23.12.2019.
//  Copyright © 2019 Janet Van. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Whenever the network manager updates, the variable is going to get triggered
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("Hacker News")
        }
            // View did load
            .onAppear {
                self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

