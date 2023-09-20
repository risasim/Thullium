//
//  ElementModel.swift
//  FlashCards
//
//  Created by Richard on 14.09.2023.
//

import Foundation
import SwiftData

@Model
final class ElementsData{
    var elements:[ElementData]
    
    init(elements: [ElementData]) {
        self.elements = elements
    }
}

@Model
final class ElementData:Identifiable{
    var name: String
    var appearance: String?
    var atomic_mass:Double
    var boil: Double?
    var category:String
    var density: Double?
    var discoverd_by: String?
    var melt: Double?
    var molar_heat:Double?
    var named_by: String?
    var number:Int
    var period:Int
    var group:Int
    var phase:String
    var source: String
    var bohr_model_image:String?
    var bohr_model_3d:String?
    var spectral_img: String?
    var summary:String
    var symbol: String
    var xpos:Int
    var ypos:Int
    var wxpos:Int
    var wypos:Int
    var shells: [Int]
    var electron_cofiguration:String
    var electron_configuration_semantic: String
    var electron_affinity:Double?
    var electronegativity_pauling: Double?
    var ionization_energies: [Float]
    var cpk_hex:String?
    var image: ImageData
    var block: String
    
    init(name: String, appearance: String? = nil, atomic_mass: Double, boil: Double? = nil, category: String, density: Double? = nil, discoverd_by: String? = nil, melt: Double? = nil, molar_heat: Double? = nil, named_by: String? = nil, number: Int, period: Int, group: Int, phase: String, source: String, bohr_model_image: String? = nil, bohr_model_3d: String? = nil, spectral_img: String? = nil, summary: String, symbol: String, xpos: Int, ypos: Int, wxpos: Int, wypos: Int, shells: [Int], electron_cofiguration: String, electron_configuration_semantic: String, electron_affinity: Double? = nil, electronegativity_pauling: Double? = nil, ionization_energies: [Float], cpk_hex: String? = nil, image: ImageData, block: String) {
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
final class ImageData{
    var title: String
    var url: String
    var attribution:String
    var parentElement:ElementData?
    
    init(title: String, url: String, attribution: String) {
        self.title = title
        self.url = url
        self.attribution = attribution
    }
}


struct Elements:Codable{
     let elements: [Element]
 }

 // MARK: - Element
struct Element:Codable {
    let name:String
    let appearance: String?
    let atomic_mass:Double
    let boil: Double?
    let category: String
    let density: Double?
    let discovered_by: String?
    let melt:Double?
    let molar_heat: Double?
    let named_by: String?
    let number, period, group: Int
    let phase: String
    let source: String
    let bohr_model_image: String?
    let bohr_model_3d: String?
    let spectral_img: String?
    let summary, symbol: String
    let xpos, ypos, wxpos, wypos: Int
    let shells: [Int]
    let electron_configuration, electron_configuration_semantic: String
    let electron_affinity:Double?
    let electronegativity_pauling: Double?
    let ionization_energies: [Float]
    let cpk_hex: String?
    let image: ElementImage
    let block: String
 }

 // MARK: - Image
struct ElementImage :Codable{
     let title: String
     let url: String
     let attribution: String
 }


