//
//  FormContentBuilderImplementation.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 8/9/21.
//

import Foundation

class FormContentBuilderImplementation {
    
    var content : [FormSectionComponent] {
        var returnType: [FormSectionComponent]
        returnType = [FormSectionComponent(items: [
            DateFormComponent(id: FormField.dateTime, mode: .time),
            TextFormComponent(id: FormField.numPeople, placeholder: "Number of People", keyboardType: .numberPad),
            TextFormComponent.init(id: FormField.name, placeholder: "Name of Book"),
            TextFormComponent.init(id: FormField.notes, placeholder: "Any Additional Notes"),
            ButtonFormItem.init(id: FormField.submit, title: "Save Reservation")
        ])]
        
        return returnType
    }
}
