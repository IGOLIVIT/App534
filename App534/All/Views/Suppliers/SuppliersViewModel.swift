//
//  SuppliersViewModel.swift
//  App534
//
//  Created by IGOR on 28/09/2024.
//

import SwiftUI
import CoreData

final class SuppliersViewModel: ObservableObject {

    @AppStorage("totalSuppliers") var totalSuppliers: [String] = []
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isSettings: Bool = false
    @Published var isAddTrans: Bool = false
    @Published var isAddSupp: Bool = false
    @Published var isStat: Bool = false

    @AppStorage("amountSuppliers") var amountSuppliers: Int = 0
    @AppStorage("netProfit") var netProfit: Int = 0
    @Published var addAS = ""
    @Published var addNP = ""

    @Published var supName: String = ""
    @Published var supAmount: String = ""
    @Published var supFlow: String = ""

    @Published var suppliers: [SuppModel] = []
    @Published var selectedSupp: SuppModel?
    
    func addSupp() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SuppModel", into: context) as! SuppModel
        
        loan.supName = supName
        loan.supAmount = supAmount
        loan.supFlow = supFlow

        CoreDataStack.shared.saveContext()
    }
    
    func fetchSupps() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SuppModel>(entityName: "SuppModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.suppliers = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.suppliers = []
        }
    }
    
    @Published var trSup: String = ""
    @Published var trPurch: String = ""
    @Published var trTC: String = ""
    @Published var trDate: String = ""

    @Published var transactions: [TransModel] = []
    @Published var selectedTrans: TransModel?
    
    func addTrans() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TransModel", into: context) as! TransModel
        
        loan.trSup = trSup
        loan.trPurch = trPurch
        loan.trTC = trTC
        loan.trDate = trDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchTrans() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TransModel>(entityName: "TransModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.transactions = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.transactions = []
        }
    }
}
