//
//  GunningFogServiceProtocol.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05.11.2021.
//

import Foundation

protocol GanningFogSeviceProtocol {
    func getGunningFogIndex(for text: String, complitionHandler: @escaping (Double?, Error?) -> Void)
}
