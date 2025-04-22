//
//  ElectronConfigStatusBar.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

///Status bar that shows if the user shall pick one element or wheteher such a choice was successfull
struct ElectronConfigStatusBar: View {
    ///
    @Binding var stat:Bool?
    ///If we are playing on the names or on the configruation
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
        }else{
            HStack{
                Spacer()
                Text(playNames ?"electronConfigGame.playNames":"electronConfigGame.playConfig")
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
    }
}

#Preview {
    ElectronConfigStatusBar(stat: .constant(true))
}
