//
//  CreatePostViewController.swift
//  CoordinatorsDemo
//
//  Created by Prashant Bhargava on 2020-05-14.
//  Copyright © 2020 hootsuite. All rights reserved.
//

import UIKit


protocol CreatePostViewControllerDelegate: AnyObject {
    func createPostViewController(_ viewController: CreatePostViewController, didPost message: Message?)
}

class CreatePostViewController: UIViewController {
    weak var delegate: CreatePostViewControllerDelegate?
    var user: User!

    @IBOutlet weak var txtMessage: UITextView!
    @IBOutlet weak var lblGreetings: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblGreetings.text = "Hi, \(user.name)"
    }

    @IBAction func postAction(_ sender: Any) {
        txtMessage.endEditing(true)
        delegate?.createPostViewController(self, didPost: Message(text: txtMessage.text))
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)

        if parent == nil {
            delegate?.createPostViewController(self, didPost: nil)
        }
    }
}
