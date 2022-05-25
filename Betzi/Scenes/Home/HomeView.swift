//
//  HomeView.swift
//  Betzi
//
//  Created by Daniel Fernandez Yopla on 23.05.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Text("Home")

            Button(action: { viewModel.presentFlow1Tap() }, label: {
                Text("Present flow 1 with modal")
            })

            Button(action: { viewModel.presentFlow2Tap() }, label: {
                Text("Present flow 2 with push")
            })

            Button(action: { viewModel.presentIndependentModal.send() }, label: {
                Text("Present independent coordinator modal")
            })

            Button(action: { viewModel.presentIndependentPush.send() }, label: {
                Text("Present independent coordinator push")
            })
        }
    }
}

struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init())
    }
}
