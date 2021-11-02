//
//  LocationManagerRepository.swift
//  Satuju
//
//  Created by Gede Wicaksana on 01/11/21.
//

import SwiftUI

final class LocationManagerRepository: NSObject {
    @StateObject private var viewModel = LocationManagerService()
    @Published var country = ""
    @Published var state = ""

    override init() {
        super.init()
        
    }
}
