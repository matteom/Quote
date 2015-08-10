//
//  EditViewController.swift
//  Quote
//
//  Created by Matteo Manferdini on 04/08/15.
//  Copyright (c) 2015 Matteo Manferdini. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: class {
	func quoteWasSaved(quote: Quote)
}

class EditViewController: UIViewController {
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var textField: UITextField!
	
	var quote: Quote?
	weak var delegate: EditViewControllerDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		textView.text = quote?.text
		textField.text = quote?.author
	}
	
	@IBAction func save(sender: AnyObject) {
		let newQuote = Quote(text: textView.text, author: textField.text)
		delegate?.quoteWasSaved(newQuote)
		self.navigationController?.popViewControllerAnimated(true)
	}
}
