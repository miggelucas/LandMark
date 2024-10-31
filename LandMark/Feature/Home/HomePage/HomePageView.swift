//
//  HomePageView.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import SwiftUI



struct HomePageView: View {
    @StateObject var viewModel: Self.ViewModel
    
    var body: some View {
        VStack {
            Text("Wellcome to LandMark App!")
            
            Button("Press me to try out our totally awesome navigation feature") {
                viewModel.didTapOnTryMeButton()
            }
        }
    }
}

#Preview {
    HomePageView(viewModel: .init())
}
