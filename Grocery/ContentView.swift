//
//  ContentView.swift
//  Grocery
//
//  Created by Luan.Lima on 19/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @ObservedObject private var storeListVM = StoreListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(storeListVM.stores, id: \.storeId) { store in
                    
                    NavigationLink (destination: StoreItemsListView(store: store), label: {
                        StoreCell(store: store)
                    })
                }.listStyle(PlainListStyle())
            }
            
            .sheet(isPresented: $isPresented, onDismiss: {
                storeListVM.getAll()
            }, content:  {
                AddStoreView()
            })
            .navigationBarItems(trailing: Button(action: {
                isPresented = true
            }, label: {
                Image(systemName: "plus")
            }))
            .navigationTitle("Grocery")
            
            .onAppear {
                storeListVM.getAll()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StoreCell: View {
    
    let store: StoreViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(store.name)
                .font(.headline)
            Text(store.adrress)
                .font(.body)
        }
    }
}
