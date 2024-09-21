//
//  UserDefaults.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import Foundation

let UD = UserDefaults(suiteName: "uz.MedXpress.www")!

extension UserDefaults {
    
    public var language: String {
        get { return unarchiveObject(key: "appLanguage").notNullString }
        set { archivedData(key: "appLanguage", object: newValue )    }
    }

    var mode: String? {
        get { return self.string(forKey: "appMode") }
        set { self.set(newValue, forKey: "appMode") }
    }
    
    func unarchiveObject(key: String) -> Any? {
        if let data = value(forKey: key) as? Data {
                do {
                    if let result = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSArray.self, NSString.self, NSNumber.self], from: data) {
                        return (result as AnyObject).value(forKey: "Data")
                    }
                }
            return nil
        }
        return nil
    }
    
    func archivedData(key: String, object: Any) {
        let result = NSMutableDictionary()
        result.setValue(object, forKey: "Data")
            do {
                let encodedObject = try? NSKeyedArchiver.archivedData(withRootObject: result, requiringSecureCoding: false)
                set(encodedObject, forKey: key)
            }
    }
    
    var token: String? {
        get { return self.string(forKey: "token") }
        set { self.set(newValue, forKey: "token") }
    }
    
    var room_ID: String? {
        get { return self.string(forKey: "room_ID") }
        set { self.set(newValue, forKey: "room_ID") }
    }
    
    var voiceAI_ID: String? {
        get { return self.string(forKey: "voiceAI_ID") }
        set { self.set(newValue, forKey: "voiceAI_ID") }
    }
    
    var email: String? {
        get { return self.string(forKey: "email") }
        set { self.set(newValue, forKey: "email") }
    }
    
}

extension Optional {
    var notNullString: String {
        switch self {
        case .some(let value): return String(describing: value)
        case .none : return ""
        }
    }
}
