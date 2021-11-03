//
//  LanguangeItem.swift
//  Satuju
//
//  Created by Arif Rahman on 01/11/21.
//

import SwiftUI

struct LanguangeItem: View {
    @State var language: String = ""
    @State var isSelected: Bool = false
    var body: some View {
        HStack {
            Text(language)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.black)
            }
        }
    }
}

struct LanguangeItem_Previews: PreviewProvider {
    static var previews: some View {
        LanguangeItem()
    }
}
