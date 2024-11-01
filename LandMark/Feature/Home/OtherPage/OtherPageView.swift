//
//  OtherPageView.swift
//  LandMark
//
//  Created by Lucas Migge on 30/10/24.
//

import SwiftUI



struct OtherPageView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Text("Other Page View")
    }
}

#Preview {
    OtherPageView(viewModel: .init())
}
