//
//  ContentView.swift
//  Satuju
//
//  Created by Yossan Rahmadi on 27/10/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {

    init() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,

            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { _, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if oldSchemaVersion < 1 {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }

    var body: some View {
        TranslationView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
