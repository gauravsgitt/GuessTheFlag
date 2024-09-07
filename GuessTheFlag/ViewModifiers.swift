//
//  ViewModifiers.swift
//  GuessTheFlag
//
//  Created by Gaurav Bisht on 07/09/24.
//

import SwiftUI

struct AppTitleText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
}
