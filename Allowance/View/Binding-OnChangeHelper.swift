//
//  Binding-OnChangeHelper.swift
//  Allowance
//
//  Created by Seth Wright on 1/16/23.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {self.wrappedValue},
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
