//
//  AddStoreViewModel.swift
//  Grocery
//
//  Created by Luan.Lima on 19/01/24.
//

import Foundation

class AddStoreViewModel: ObservableObject {
    
    private var firestoreManager: FirestoreManager
    @Published var saved: Bool = false
    @Published var message: String = ""
    
    var name: String = ""
    var address: String = ""
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func save() {
        
        let store = Store(name: name, address: address)
        firestoreManager.save(store: store) { result in
            switch result {
            case .success(let store):
                DispatchQueue.main.async {
                    self.saved = store == nil ? false: true
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.message = Constants.Messages.storeSavedFailure
                }
            }
            
        }
        
    }
}
