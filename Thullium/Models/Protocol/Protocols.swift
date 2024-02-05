//
//  Protocols.swift
//  Thullium
//
//  Created by Richard on 05.02.2024.
//

import Foundation

///Protocol that ensures that any gaming model have these function in order to call the ``CustomAlertView``
protocol GamingModel{
    func restartGame()
    func showAlertToggle()
}

protocol ElementInfoData{
    var name: String { get }
    var symbol: String { get }
}
