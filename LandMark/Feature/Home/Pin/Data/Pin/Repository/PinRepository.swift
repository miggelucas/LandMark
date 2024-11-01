//
//  PinRepository.swift
//  LandMark
//
//  Created by Lucas Migge on 31/10/24.
//


protocol PinRepositoryProtocol {
    func fetchPins() -> [Pin]
    func savePin(_ pin: Pin)
    func deletePin(_ pin: Pin)
}

class PinRepository: PinRepositoryProtocol {
    let dataSource: CoreDataDataSource<CDPin>
    
    init(dataSource: CoreDataDataSource<CDPin> = CoreDataDataSource()) {
        self.dataSource = dataSource
    }
    
    func fetchPins() -> [Pin] {
        let cdpins = dataSource.fetchAll()
        return cdpins.map { Pin(cdpin: $0) }
    }
    
    func savePin(_ pin: Pin) {
        let cdpin = CDPin(context: dataSource.context)
        cdpin.update(with: pin, in: dataSource.context)
        dataSource.create(cdpin)
    }
    
    func deletePin(_ pin: Pin) {
        guard let cdpin = dataSource.fetchAll().first(where: { $0.id == pin.id }) else { return }
        dataSource.delete(cdpin)
    }
}
