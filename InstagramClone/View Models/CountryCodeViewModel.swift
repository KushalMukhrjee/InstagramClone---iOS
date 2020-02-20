//
//  CountryCodeViewModel.swift
//  InstagramClone
//
//  Created by Kushal on 10/02/20.
//  Copyright © 2020 Kushal. All rights reserved.
//

import Foundation

class CountryCodeViewModel {
    
    var countryCodes = [CountryCodeModel]()
    
    
    func getCountryCodes(){
        
        do {
            
            guard let jsonUrl = Bundle.main.url(forResource: "countryCodes", withExtension: "json") else {return}
            let jsonData = try Data(contentsOf: jsonUrl)
            self.countryCodes = try JSONDecoder().decode([CountryCodeModel].self, from: jsonData)
            
        } catch {
            print("error parsing country code json")
        }
    }
    
    
    
}
