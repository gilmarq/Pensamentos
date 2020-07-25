
//
//  QuotesMeneger.swift
//  Pensamentos
//
//  Created by Gilmar Queiroz on 20/07/20.
//  Copyright © 2020 Gilmar Queiroz. All rights reserved.
//

import Foundation

class  QuotesMeneger {
    
    let quotes: [Quote]
    init() {
        
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        
        let jsonData =  try! Data(contentsOf: fileURL)
        let JsonDecoder = JSONDecoder()
        
        quotes = try!  JsonDecoder.decode([Quote].self, from: jsonData)
        
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }

}
