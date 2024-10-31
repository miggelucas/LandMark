//
//  PinListView.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//


import SwiftUI



struct PinListView: View {
    
    @StateObject var viewModel: Self.ViewModel
    
    var body: some View {
        List(viewModel.pins) { pin in
            self.buildPinRowView(for: pin)
        }
        .navigationTitle("Pins")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.didTapOnPinButton()
                } label: {
                    Image(systemName: "mappin.circle")
                }
            }
        }
    }
    
    @ViewBuilder
    func buildPinRowView(for pin: Pin) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Pin ID: \(pin.id.uuidString.prefix(8))")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("Created at: \(pin.createdAt.formatted(date: .long, time: .shortened))") // Formatação da data
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("Lat: \(String(format: "%.6f", pin.latitude))") // Limitar a 6 casas decimais
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Lng: \(String(format: "%.6f", pin.longitude))") // Limitar a 6 casas decimais
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer() // Adiciona espaço entre o conteúdo e a borda direita
        }
    }
}

#Preview {
    NavigationStack {
        PinListView(viewModel: .init())
    }
}
