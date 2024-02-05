//
//  ElectronConfigStatusBar.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

struct ElectronConfigStatusBar: View {
    
    @Binding var stat:Bool?
    @AppStorage("playNames") var playNames  = true
    
    var body: some View {
        if stat != nil{
            if stat!{
                HStack{
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundStyle(Color.green)
                    Text("electronConfigGame.sucess")
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding()
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
                }
            }else{
                HStack{
                    Spacer()
                    Image(systemName: "xmark")
                        .foregroundStyle(Color.red)
                    Text("electronConfigGame.wrong")
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding()
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
                }
            }
        }else if !playNames{
            Text("Please enter the config in this format [Xe] 4f13 6s2")
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .foregroundStyle(.secondary)
                .padding()
                .background{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .foregroundStyle(.ultraThinMaterial)
                }
        }
    }
}

#Preview {
    ElectronConfigStatusBar(stat: .constant(true))
}