//
//  CoreDataAttributeDescription.swift
//  CoreDataModelDescription
//
//  Created by Dmytro Anokhin on 12/08/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import CoreData


/// Describes and creates`NSAttributeDescription`
public struct CoreDataAttributeDescription {

    public static func attribute(name: String, type: NSAttributeType, isOptional: Bool = false, defaultValue: Any? = nil, className: String? = nil, isIndexedBySpotlight: Bool = false) -> CoreDataAttributeDescription {
        return CoreDataAttributeDescription(name: name, attributeType: type, isOptional: isOptional, defaultValue: defaultValue, className: className, isIndexedBySpotlight: isIndexedBySpotlight)
    }

    public var name: String

    public var attributeType: NSAttributeType

    public var isOptional: Bool
    
    public var defaultValue: Any?
    
    public var className: String?
    
    public var valueTransformerName: String?
        
    public var isIndexedBySpotlight: Bool

    public func makeAttribute() -> NSAttributeDescription {
        let attribute = NSAttributeDescription()        
        attribute.name = name
        attribute.attributeType = attributeType
        attribute.isOptional = isOptional
        attribute.isIndexedBySpotlight = isIndexedBySpotlight
        
        if let defaultValue = defaultValue {
            attribute.defaultValue = defaultValue
        }
        
        if let className = className {
            attribute.attributeValueClassName = className
            attribute.valueTransformerName = valueTransformerName ?? "NSSecureUnarchiveFromData"
        }
        
        return attribute
    }
}
