//
//  AddStoreView.swift
//  Grocery
//
//  Created by Luan.Lima on 19/01/24.
//

import SwiftUI

struct AddStoreView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addStoreVM = AddStoreViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $addStoreVM.name)
                    TextField("Endereço", text: $addStoreVM.address)
                    HStack {
                        Spacer()
                        Button("Save") {
                            addStoreVM.save()
                        }.onChange(of: addStoreVM.saved) { value in
                            if value {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        
                        
                        Spacer()
                    }
                    Text(addStoreVM.message)
                }.navigationBarItems(leading: Button(action: {
                    presentationMode
                        .wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }))
                .navigationTitle("Add New Store")
            }
        }
        
    }
}

struct AddStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoreView()
    }
}
