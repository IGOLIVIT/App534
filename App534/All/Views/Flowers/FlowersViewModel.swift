//
//  FlowersViewModel.swift
//  App534
//
//  Created by IGOR on 28/09/2024.
//

import SwiftUI
import CoreData

final class FlowersViewModel: ObservableObject {

    @AppStorage("totalSuppliers") var totalSuppliers: [String] = []
    @Published var curSupp: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isSettings: Bool = false
    @Published var isAddFlower: Bool = false

    @AppStorage("totalFlowers") var totalFlowers: Int = 0

    @Published var flName: String = ""
    @Published var flAmount: String = ""
    @Published var flPrice: String = ""
    @Published var flDescr: String = ""
    @Published var flSupp: String = ""

    @Published var flowers: [FlowerModel] = []
    @Published var selectedFlower: FlowerModel?
    
    func addFlower() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FlowerModel", into: context) as! FlowerModel
        
        loan.flName = flName
        loan.flAmount = flAmount
        loan.flPrice = flPrice
        loan.flDescr = flDescr
        loan.flSupp = flSupp

        CoreDataStack.shared.saveContext()
    }
    
    func fetchFlowers() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FlowerModel>(entityName: "FlowerModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.flowers = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.flowers = []
        }
    }
    
    @Published var search: String = ""
    
    func fetchCoursesBySearch() -> [FlowerModel] {
        
        return flowers.isEmpty ? flowers : search.isEmpty ? flowers : flowers.filter{($0.flName ?? "").lowercased().contains(search.lowercased())}
    }

}
