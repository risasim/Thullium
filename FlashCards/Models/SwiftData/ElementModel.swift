//
//  ElementModel.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import Foundation
import SwiftData

@Model
final class Element{
    var name: String
    var appearance: String
    var atomic_mass:Float
    var boil: Float
    var category:String
    var density: Float
    var discoverd_by: String
    var melt: Float
    var molar_heat:Float
    var named_by: String
    var number:Int
    var period:Int
    var group:Int
    var phase:String
    var source: String
    var bohr_model_image:String
    var bohr_model_3d:String
    var spectral_img: String
    var summary:String
    var symbol: String
    var xpos:Int
    var ypos:Int
    var wxpos:Int
    var wypos:Int
    var shells: Array<Int>
    var electron_cofiguration:String
    var electron_configuration_semantic: String
    var electron_affinity: Float
    var electronegativity_pauling: Float
    var ionization_energies: Array<Float>
    var cpk_hex:String
    var image: Image
    var block: String
    
    init(name: String, appearance: String, atomic_mass: Float, boil: Float, category: String, density: Float, discoverd_by: String, melt: Float, molar_heat: Float, named_by: String, number: Int, period: Int, group: Int, phase: String, source: String, bohr_model_image: String, bohr_model_3d: String, spectral_img: String, summary: String, symbol: String, xpos: Int, ypos: Int, wxpos: Int, wypos: Int, shells: Array<Int>, electron_cofiguration: String, electron_configuration_semantic: String, electron_affinity: Float, electronegativity_pauling: Float, ionization_energies: Array<Float>, cpk_hex: String, image: Image, block: String) {
        self.name = name
        self.appearance = appearance
        self.atomic_mass = atomic_mass
        self.boil = boil
        self.category = category
        self.density = density
        self.discoverd_by = discoverd_by
        self.melt = melt
        self.molar_heat = molar_heat
        self.named_by = named_by
        self.number = number
        self.period = period
        self.group = group
        self.phase = phase
        self.source = source
        self.bohr_model_image = bohr_model_image
        self.bohr_model_3d = bohr_model_3d
        self.spectral_img = spectral_img
        self.summary = summary
        self.symbol = symbol
        self.xpos = xpos
        self.ypos = ypos
        self.wxpos = wxpos
        self.wypos = wypos
        self.shells = shells
        self.electron_cofiguration = electron_cofiguration
        self.electron_configuration_semantic = electron_configuration_semantic
        self.electron_affinity = electron_affinity
        self.electronegativity_pauling = electronegativity_pauling
        self.ionization_energies = ionization_energies
        self.cpk_hex = cpk_hex
        self.image = image
        self.block = block
    }
    
}

@Model
final class Image{
    var title: String
    var url: String
    var attribution:String
    
    init(title: String, url: String, attribution: String) {
        self.title = title
        self.url = url
        self.attribution = attribution
    }
}

