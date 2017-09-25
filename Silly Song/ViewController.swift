//
//  ViewController.swift
//  Silly Song
//
//  Created by Nikos Fronimakis on 21/09/2017.
//  Copyright © 2017 Nikos Fronimakis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            
        } else {
            lyricsView.text = "Please wright a name first"
        }
    }
    

}






let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func shortNameFromName(name: String)-> String {
    let vowels = ["a", "e", "i", "o", "u"]
    var shortNameArray = Array(name.lowercased().characters).map { String($0) }
    var newNameArray = [String]()
    
    for _ in 0..<shortNameArray.endIndex{
        if vowels.contains(shortNameArray[0]){
            newNameArray = shortNameArray
        } else {
            shortNameArray.remove(at: 0)
        }
    }
    print(newNameArray)
    
    
    return newNameArray.joined()
    
}



func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    
    return lyrics
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



