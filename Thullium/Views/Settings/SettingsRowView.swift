//
//  SettingsRowView.swift
//  Thullium
//
//  Created by Richard on 17.12.2023.
//

import SwiftUI

struct SettingsRowView: View {
    
    var label: String
    var description: String? = nil
    var linkLabel:String? = nil
    var linkDestination : String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(LocalizedStringKey(label))
                    .foregroundColor(.gray)
                Spacer()
                if description != nil {
                    Text(LocalizedStringKey(description!))
                } else if linkLabel != nil && linkDestination != nil{
                    Link( linkLabel! ,destination: URL(string: "http://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.blue)
                }else {
                    EmptyView()
                }
                
            }
        }
    }
}

#Preview {
    SettingsRowView(label: "Version", description: "0.8")
}
