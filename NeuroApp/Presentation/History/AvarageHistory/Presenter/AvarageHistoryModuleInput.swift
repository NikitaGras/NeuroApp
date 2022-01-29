//
//  AvarageHistoryAvarageHistoryModuleInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 17/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import ViperMcFlurry

protocol AvarageHistoryModuleInput: RamblerViperModuleInput {
    var result: Session! { get set }
}
