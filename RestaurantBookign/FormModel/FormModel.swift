//
//  FormModel.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 8/9/21.
//

import Foundation

import UIKit

/**
 * Implementation for a form item
 */

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
}

/**
 * Implementation for a form section
 */

protocol FormSectionItem {
    var id: UUID { get }
    var items: [FormComponent] { get }
    init(items: [FormComponent])
}



/**
 * Component for a form section the form
 */

final class FormSectionComponent: FormSectionItem, Hashable {

    let id: UUID = UUID()
    var items: [FormComponent]

    required init(items: [FormComponent]) {
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
  
    static func == (lhs: FormSectionComponent, rhs: FormSectionComponent) -> Bool {
        lhs.id == rhs.id
    }
}

/**
 * Component for a form items the form
 */

class FormComponent: FormItem, Hashable {

    let id = UUID()
    let formId: FormField
    var value: Any?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormComponent, rhs: FormComponent) -> Bool {
        lhs.id == rhs.id
    }
    
    init(_ id: FormField) {
        self.formId = id
    }
}

/**
 * Component for a text item in the form
 */

final class TextFormComponent: FormComponent {
   
    let placeholder: String
    let keyboardType: UIKeyboardType
    let editable: Bool
    
    init(id: FormField,
        placeholder: String,
        keyboardType: UIKeyboardType = .default,
        editable: Bool = true) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.editable = editable
        super.init(id)
    }
}

/**
 * Component for a date item in the form
 */

final class DateFormComponent: FormComponent {

    let mode: UIDatePicker.Mode
    
    init(id: FormField,
         mode: UIDatePicker.Mode) {
        self.mode = mode
        super.init(id)
    }
}

/**
 * Component for a button item in the form
 */

final class ButtonFormItem: FormComponent {

    let title: String
    
    init(id: FormField,
         title: String) {
        self.title = title
        super.init(id)
    }
}

