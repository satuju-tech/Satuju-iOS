//
//  TranslationHistory.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 01/11/21.
//

import Foundation
import RealmSwift

class TranslationHistory: Object {

    @objc dynamic var id = UUID()
    @objc dynamic var originLang = ""
    @objc dynamic var destinationLang = ""
    @objc dynamic var originText = ""
    @objc dynamic var destinationText = ""
    @objc dynamic var isLeft = true

    override class func primaryKey() -> String? {
        return "id"
    }

}
