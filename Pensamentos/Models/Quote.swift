//
//  Quote.swift
//  Pensamentos
//
//  Created by Gilmar Queiroz on 20/07/20.
//  Copyright © 2020 Gilmar Queiroz. All rights reserved.
//

import Foundation


struct Quote: Codable {
    
    let quote:  String
    let author: String
    let image:  String
    
    var quoteFormatted: String{
        return "❝" + quote + "❞"
    }
    var authirformatted: String{
        return "-" +  author + "❞-"
    }

}
 
