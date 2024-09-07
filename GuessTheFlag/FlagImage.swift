//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Gaurav Bisht on 07/09/24.
//

import SwiftUI

struct FlagImage: View {
    
    let flagName: String
    
    var body: some View {
        Image(flagName)
            .clipShape(.capsule)
            .shadow(radius: 10)
    }
}

#Preview {
    FlagImage(flagName: "US")
}
