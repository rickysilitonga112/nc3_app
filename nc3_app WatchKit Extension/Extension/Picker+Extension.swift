//
//  Picker+Extension.swift
//  nc3_app WatchKit Extension
//
//  Created by Ricky Silitonga on 20/07/22.
//

import Foundation
import SwiftUI

extension Picker {
    func focusBorderHidden() -> some View {
        let isWatchOS7: Bool = {
            if #available(watchOS 7, *) {
                return true
            }
            
            return false
        }()
        
        let padding: EdgeInsets = {
            if isWatchOS7 {
                return .init(top: 17, leading: 0, bottom: 0, trailing: 0)
            }
            
            return .init(top: 8.5, leading: 0.5, bottom: 8.5, trailing: 0.5)
        }()
        
        return self
            .overlay(
                RoundedRectangle(cornerRadius: isWatchOS7 ? 8 : 7)
                    .stroke(Color.black, lineWidth: isWatchOS7 ? 4 : 3.5)
                    .offset(y: isWatchOS7 ? 0 : 8)
                    .padding(padding)
            )
    }
}
