//
//  StoreItemsListView.swift
//  Grocery
//
//  Created by Luan.Lima on 20/01/24.
//

import SwiftUI

struct StoreItemsListView: View {
   
    var store: StoreViewModel
    @StateObject private var storeItemListVM = StoreItemListViewModel()
    
    @State private var storeItemVS = StoreItemViewState()

    private func deleteStoreItem(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let storeItem = storeItemListVM.storeItems[index]
            storeItemListVM.deleteStoreItem(storeId: store.storeId, storeItemId: storeItem.storeItemId)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter item name", text: $storeItemVS.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Price", text: $storeItemVS.price)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Quantity", text: $storeItemVS.quantity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save") {
                storeItemListVM.addItemToStore(storeId: store.storeId, storeItemVS: storeItemVS) { error in
                    
                    if error == nil {
                        storeItemVS = StoreItemViewState()
                        storeItemListVM.getStoreItemsBy(storeId: store.storeId)
                    }
                }
            }
           
            List{
                
                ForEach(storeItemListVM.storeItems, id: \.storeItemId) {
                    storeItem in
                    Text(storeItem.name)
                }.onDelete(perform: deleteStoreItem)
                
            }

            Spacer()
            
            .onAppear(){
                storeItemListVM.getStoreItemsBy(storeId: store.storeId)           }
        }
    }
}

struct StoreItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemsListView(store: StoreViewModel(store: Store(id: "123", name: "HEB", address: "1200 Hichmont street", items: nil)))
    }
}
