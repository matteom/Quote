//
//  ViewController.swift
//  Quote
//
//  Created by Matteo Manferdini on 31/07/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController, EditViewControllerDelegate {
	@IBOutlet weak var quoteTextLabel: UILabel!
	@IBOutlet weak var quoteAuthorLabel: UILabel!
	
	let modelController = ModelController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUIWithQuote(modelController.quote)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if let editViewController = segue.destinationViewController as? EditViewController {
			editViewController.quote = modelController.quote
			editViewController.delegate = self
		}
	}
	
	func quoteWasSaved(quote: Quote) {
		modelController.quote = quote
		updateUIWithQuote(quote)
	}
	
	func updateUIWithQuote(quote: Quote) {
		quoteTextLabel.text = quote.text
		quoteAuthorLabel.text = quote.author
	}
}