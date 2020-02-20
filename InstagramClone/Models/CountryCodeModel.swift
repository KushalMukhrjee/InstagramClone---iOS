//
//  CountryCodeModel.swift
//  InstagramClone
//
//  Created by Kushal on 10/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import Foundation


class CountryCodeModel: Codable {
 
     var name: String
     var dialCode: String
     var code: String
     
     private enum CodingKeys: String, CodingKey {
         case name
         case dialCode = "dial_code"
         case code
     }
 
}

