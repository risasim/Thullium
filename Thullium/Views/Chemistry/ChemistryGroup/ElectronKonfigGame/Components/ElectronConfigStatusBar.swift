//
//  ElectronConfigStatusBar.swift
//  Thullium
//
//  Created by Richard on 04.02.2024.
//

import SwiftUI

///Status bar that shows if the user shall pick one element or wheteher such a choice was successfull
struct ElectronConfigStatusBar: View {
    @Binding var model:ElectronConfigGameModel
    ///If we are playing on the names or on the configruation
    @AppStorage("playNames") var playNames  = true
    
    var body: some View {
        //If the status is nil it means that the game should show default game text
        if model.status != nil{
            //If teh status is true it shows success
            if model.status!{
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
                //If the status is false it shows that the guess was unsuccessful
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
    ElectronConfigStatusBar(model: .constant(ElectronConfigGameModel()))
}
