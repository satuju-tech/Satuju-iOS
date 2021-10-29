//
//  MenuListView.swift
//  Satuju
//
//  Created by Gede Wicaksana on 29/10/21.
//

import SwiftUI

struct MenuListView: View {
    @State var autoPlayCheck: Bool = false
    @State var detectLanguageCheck: Bool = false

    init() {
        UITableView.appearance().backgroundColor = .none
    }
    var body: some View {
        List {
            Button(action: {autoPlay()}, label: {
                HStack {
                    if autoPlayCheck {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .hidden()
                    }
                    Text("Auto Play Translation")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                }
            }).buttonStyle(PlainButtonStyle())
            Button(action: {detectLanguage()}, label: {
                HStack {
                    if detectLanguageCheck {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .hidden()
                    }
                    Text("Detect Language")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                }
            }).buttonStyle(PlainButtonStyle())
            Button(action: {}, label: {
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                    Text("Clear History")
                        .foregroundColor(.red)
                        .font(.system(size: 17))
                }
            }).buttonStyle(PlainButtonStyle())
        }
        .hasScrollEnabled(false)
        .cornerRadius(14)
        .padding()
        .frame(width: 300, height: 200, alignment: .topLeading)
    }
    func autoPlay() {
        if autoPlayCheck {
            autoPlayCheck = false
        } else {
            autoPlayCheck = true
        }
    }
    func detectLanguage() {
        if detectLanguageCheck {
            detectLanguageCheck = false
        } else {
            detectLanguageCheck = true
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView().colorScheme(.dark)
    }
}
