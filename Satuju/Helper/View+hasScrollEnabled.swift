//
//  View+hasScrollEnabled.swift
//  Satuju
//
//  Created by Gede Wicaksana on 06/11/21.
//

import SwiftUI

extension View {

    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }

}
