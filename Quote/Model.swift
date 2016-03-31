//
//  Model.swift
//  Quote
//
//  Created by Matteo Manferdini on 31/07/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import Foundation

class Quote: NSObject, NSCoding {
	let text: String
	let author: String
	
	init(text: String, author: String) {
		self.text = text
		self.author = author
	}
	
	required init?(coder aDecoder: NSCoder) {
		text = aDecoder.decodeObjectForKey(Keys.Text.rawValue) as! String
		author = aDecoder.decodeObjectForKey(Keys.Author.rawValue) as! String
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(text, forKey: Keys.Text.rawValue)
		aCoder.encodeObject(author, forKey: Keys.Author.rawValue)
	}
	
	enum Keys: String {
		case Text = "text"
		case Author = "author"
	}
	
}

class ModelController {
	let quoteFilePath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + "/quote.txt"
	var quote: Quote {
		get {
			return NSKeyedUnarchiver.unarchiveObjectWithFile(quoteFilePath) as? Quote
			?? Quote(text: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.", author: "Albert Einstein")
		}
		set {
			NSKeyedArchiver.archiveRootObject(newValue, toFile: quoteFilePath)
		}
	}
}