//
//  UISearchBar+Ext.swift
//  ToDoApp
//
//  Created by Никита Швец on 14.01.2023.
//

import Foundation
import UIKit

extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}


