//
//  GameVC.swift
//  Green24
//
//  Created by Liuke Yang on 4/27/17.
//  Copyright © 2017 Liuke Yang. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

// MARK: Tiles
    
    @IBOutlet weak var tileA0: UIImageView!
    @IBOutlet weak var tileB0: UIImageView!
    @IBOutlet weak var tileC0: UIImageView!
    @IBOutlet weak var tileD0: UIImageView!
    @IBOutlet weak var tileA1: UIImageView!
    @IBOutlet weak var tileB1: UIImageView!
    @IBOutlet weak var tileC1: UIImageView!
    @IBOutlet weak var tileD1: UIImageView!
    @IBOutlet weak var tileA2: UIImageView!
    @IBOutlet weak var tileB2: UIImageView!
    @IBOutlet weak var tileC2: UIImageView!
    @IBOutlet weak var tileD2: UIImageView!
    @IBOutlet weak var tileA3: UIImageView!
    @IBOutlet weak var tileB3: UIImageView!
    @IBOutlet weak var tileC3: UIImageView!
    @IBOutlet weak var tileD3: UIImageView!
    
// MARK: ScoreField
    
    @IBOutlet weak var scoreField: UITextField!

// MARK: Declarations
    
    var boardArray = [UIImageView]()
    var nextBlue = true
    let numOfTiles = 16
    var score = 0

// MARK: StartUp

    override func viewDidLoad() {
        super.viewDidLoad()
        for column in 0...3 {
            if column == 0 {
                boardArray.append(tileA0)
                boardArray.append(tileA1)
                boardArray.append(tileA2)
                boardArray.append(tileA3)
            }
            if column == 1 {
                boardArray.append(tileB0)
                boardArray.append(tileB1)
                boardArray.append(tileB2)
                boardArray.append(tileB3)
            }
            if column == 2 {
                boardArray.append(tileC0)
                boardArray.append(tileC1)
                boardArray.append(tileC2)
                boardArray.append(tileC3)
            }
            if column == 3 {
                boardArray.append(tileD0)
                boardArray.append(tileD1)
                boardArray.append(tileD2)
                boardArray.append(tileD3)
            }
        }
    }

// MARK: -SWIPEUP
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {

        if scoreField.text == "24" || scoreField.text == "25" || scoreField.text == "26" || scoreField.text == "27" || scoreField.text == "28" || scoreField.text == "29" || scoreField.text == "30" {
            showAlert(title: "CONGRATULATIONS!", message: "Whether or not you figured out the rule, you have beaten the game! You are either lucky or skillful, but that doesn't matter because you've beaten the game!")
        }
        
        // MARK: SwipeUp A-Column
        
        if tileA0.image == UIImage(named: "white") && tileA1.image == UIImage(named: "white") && tileA2.image == UIImage(named: "white"){
            tileA0.image = tileA3.image
            tileA1.image = UIImage(named: "white")
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && tileA1.image == UIImage(named: "white") {
            tileA0.image = tileA2.image
            tileA1.image = tileA3.image
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && tileA2.image == UIImage(named: "white"){
            tileA0.image = tileA1.image
            tileA1.image = tileA3.image
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") {
            tileA0.image = tileA1.image
            tileA1.image = tileA2.image
            tileA2.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileA1.image == UIImage(named: "white") && tileA2.image == UIImage(named: "white") {
            tileA1.image = tileA3.image
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileA1.image != UIImage(named: "white") && tileA2.image == UIImage(named: "white") {
            tileA2.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileA2.image != UIImage(named: "white") && tileA1.image == UIImage(named: "white") {
            tileA1.image = tileA2.image
            tileA2.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        }
        
        // MARK: SwipeUp A-Column (TO MAKE GREEN)
        
        if (tileA0.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "blue") && tileA1.image == UIImage(named: "yellow") && tileA3.image == UIImage(named: "yellow")) || (tileA0.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "blue") && tileA3.image == UIImage(named: "blue")) || (tileA0.image == UIImage(named: "blue") && tileA1.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "yellow") && tileA3.image == UIImage(named: "blue")) || (tileA0.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "blue") && tileA3.image == UIImage(named: "yellow")) {
            tileA0.image = UIImage(named: "green")
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "blue") && tileA1.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "yellow") && tileA3.image == UIImage(named: "yellow") {
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "yellow")
            tileA3.image = UIImage(named: "white")
        } else if (tileA0.image == UIImage(named: "blue") && tileA1.image == UIImage(named: "blue")) && (tileA1.image != tileA2.image) && tileA1.image != UIImage(named: "white") && tileA3.image == UIImage(named: "white"){
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if (tileA0.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "yellow")) && (tileA1.image != tileA2.image) && tileA1.image != UIImage(named: "white") && tileA3.image == UIImage(named: "white"){
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "blue") && tileA3.image == UIImage(named: "blue") {
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "blue")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && ((tileA1.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "blue")) || (tileA1.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "yellow"))) && (tileA3.image == UIImage(named: "blue") || tileA3.image == UIImage(named: "yellow")) {
            tileA0.image = UIImage(named: "green")
            tileA1.image = tileA3.image
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && ((tileA1.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "yellow") && tileA3.image == UIImage(named: "blue")) || (tileA1.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "blue") && tileA3.image == UIImage(named: "yellow"))) {
            tileA0.image = tileA1.image
            tileA1.image = UIImage(named: "green")
            tileA2.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileA2.image == UIImage(named: "white") && ((tileA0.image == UIImage(named: "blue") && tileA1.image == UIImage(named: "yellow")) || (tileA0.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "blue"))) {
            tileA0.image = UIImage(named: "green")
            tileA1.image = tileA3.image
        }


        // MARK: SwipeUp B-Column
        
        if tileB0.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white"){
            tileB0.image = tileB3.image
            tileB1.image = UIImage(named: "white")
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB0.image = tileB2.image
            tileB1.image = tileB3.image
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white"){
            tileB0.image = tileB1.image
            tileB1.image = tileB3.image
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "white") {
            tileB0.image = tileB1.image
            tileB1.image = tileB2.image
            tileB2.image = tileB3.image
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB1.image = tileB3.image
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image != UIImage(named: "white") && tileB1.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB2.image = tileB3.image
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image != UIImage(named: "white") && tileB2.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB1.image = tileB2.image
            tileB2.image = tileB3.image
            tileB3.image = UIImage(named: "white")
        }
        
        // MARK: SwipeUp B-Column (TO MAKE GREEN)
        
        if (tileB0.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "yellow") && tileB3.image == UIImage(named: "yellow")) || (tileB0.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "yellow") && tileB1.image == UIImage(named: "blue") && tileB3.image == UIImage(named: "blue")) || (tileB0.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "yellow") && tileB3.image == UIImage(named: "blue")) || (tileB0.image == UIImage(named: "yellow") && tileB1.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "blue") && tileB3.image == UIImage(named: "yellow")) {
            tileB0.image = UIImage(named: "green")
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "yellow") && tileB3.image == UIImage(named: "yellow") {
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "yellow")
            tileB3.image = UIImage(named: "white")
        } else if (tileB0.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "blue")) && (tileB1.image != tileB2.image) && tileB1.image != UIImage(named: "white") && tileB3.image == UIImage(named: "white"){
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if (tileB0.image == UIImage(named: "yellow") && tileB1.image == UIImage(named: "yellow")) && (tileB1.image != tileB2.image) && tileB1.image != UIImage(named: "white") && tileB3.image == UIImage(named: "white"){
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "yellow") && tileB1.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "blue") && tileB3.image == UIImage(named: "blue") {
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "blue")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "white") && ((tileB1.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "blue")) || (tileB1.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "yellow"))) && (tileB3.image == UIImage(named: "blue") || tileB3.image == UIImage(named: "yellow")) {
            tileB0.image = UIImage(named: "green")
            tileB1.image = tileB3.image
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB0.image == UIImage(named: "white") && ((tileB1.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "yellow") && tileB3.image == UIImage(named: "blue")) || (tileB1.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "blue") && tileB3.image == UIImage(named: "yellow"))) {
            tileB0.image = tileB1.image
            tileB1.image = UIImage(named: "green")
            tileB2.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
        } else if tileB2.image == UIImage(named: "white") && ((tileB0.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "yellow")) || (tileB0.image == UIImage(named: "yellow") && tileB1.image == UIImage(named: "blue"))) {
            tileB0.image = UIImage(named: "green")
            tileB1.image = tileB3.image
        }

        
        // MARK: SwipeUp C-Column
        
        if tileC0.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white"){
            tileC0.image = tileC3.image
            tileC1.image = UIImage(named: "white")
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC0.image = tileC2.image
            tileC1.image = tileC3.image
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white"){
            tileC0.image = tileC1.image
            tileC1.image = tileC3.image
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "white") {
            tileC0.image = tileC1.image
            tileC1.image = tileC2.image
            tileC2.image = tileC3.image
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC1.image = tileC3.image
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image != UIImage(named: "white") && tileC1.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC2.image = tileC3.image
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image != UIImage(named: "white") && tileC2.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC1.image = tileC2.image
            tileC2.image = tileC3.image
            tileC3.image = UIImage(named: "white")
        }
        
        // MARK: SwipeUp C-Column (TO MAKE GREEN)
        
        if (tileC0.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "yellow") && tileC3.image == UIImage(named: "yellow")) || (tileC0.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "yellow") && tileC1.image == UIImage(named: "blue") && tileC3.image == UIImage(named: "blue")) || (tileC0.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "yellow") && tileC3.image == UIImage(named: "blue")) || (tileC0.image == UIImage(named: "yellow") && tileC1.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "blue") && tileC3.image == UIImage(named: "yellow")) {
            tileC0.image = UIImage(named: "green")
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "yellow") && tileC3.image == UIImage(named: "yellow") {
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "yellow")
            tileC3.image = UIImage(named: "white")
        } else if (tileC0.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "blue")) && (tileC1.image != tileC2.image) && tileC1.image != UIImage(named: "white") && tileC3.image == UIImage(named: "white"){
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if (tileC0.image == UIImage(named: "yellow") && tileC1.image == UIImage(named: "yellow")) && (tileC1.image != tileC2.image) && tileC1.image != UIImage(named: "white") && tileC3.image == UIImage(named: "white"){
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "yellow") && tileC1.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "blue") && tileC3.image == UIImage(named: "blue") {
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "blue")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "white") && ((tileC1.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "blue")) || (tileC1.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "yellow"))) && (tileC3.image == UIImage(named: "blue") || tileC3.image == UIImage(named: "yellow")) {
            tileC0.image = UIImage(named: "green")
            tileC1.image = tileC3.image
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC0.image == UIImage(named: "white") && ((tileC1.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "yellow") && tileC3.image == UIImage(named: "blue")) || (tileC1.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "blue") && tileC3.image == UIImage(named: "yellow"))) {
            tileC0.image = tileC1.image
            tileC1.image = UIImage(named: "green")
            tileC2.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
        } else if tileC2.image == UIImage(named: "white") && ((tileC0.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "yellow")) || (tileC0.image == UIImage(named: "yellow") && tileC1.image == UIImage(named: "blue"))) {
            tileC0.image = UIImage(named: "green")
            tileC1.image = tileC3.image
        }

        
        // MARK: SwipeUp D-Column
        
        if tileD0.image == UIImage(named: "white") && tileD1.image == UIImage(named: "white") && tileD2.image == UIImage(named: "white"){
            tileD0.image = tileD3.image
            tileD1.image = UIImage(named: "white")
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && tileD1.image == UIImage(named: "white") {
            tileD0.image = tileD2.image
            tileD1.image = tileD3.image
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && tileD2.image == UIImage(named: "white"){
            tileD0.image = tileD1.image
            tileD1.image = tileD3.image
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") {
            tileD0.image = tileD1.image
            tileD1.image = tileD2.image
            tileD2.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileD1.image == UIImage(named: "white") && tileD2.image == UIImage(named: "white") {
            tileD1.image = tileD3.image
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileD1.image != UIImage(named: "white") && tileD2.image == UIImage(named: "white") {
            tileD2.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileD2.image != UIImage(named: "white") && tileD1.image == UIImage(named: "white") {
            tileD1.image = tileD2.image
            tileD2.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        }
        
        // MARK: SwipeUp D-Column (TO MAKE GREEN)
        
        if (tileD0.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "blue") && tileD1.image == UIImage(named: "yellow") && tileD3.image == UIImage(named: "yellow")) || (tileD0.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "blue") && tileD3.image == UIImage(named: "blue")) || (tileD0.image == UIImage(named: "blue") && tileD1.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "yellow") && tileD3.image == UIImage(named: "blue")) || (tileD0.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "blue") && tileD3.image == UIImage(named: "yellow")) {
            tileD0.image = UIImage(named: "green")
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "blue") && tileD1.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "yellow") && tileD3.image == UIImage(named: "yellow") {
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "yellow")
            tileD3.image = UIImage(named: "white")
        } else if (tileD0.image == UIImage(named: "blue") && tileD1.image == UIImage(named: "blue")) && (tileD1.image != tileD2.image) && tileD1.image != UIImage(named: "white") && tileD3.image == UIImage(named: "white"){
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if (tileD0.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "yellow")) && (tileD1.image != tileD2.image) && tileD1.image != UIImage(named: "white") && tileD3.image == UIImage(named: "white"){
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "blue") && tileD3.image == UIImage(named: "blue") {
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "blue")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && ((tileD1.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "blue")) || (tileD1.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "yellow"))) && (tileD3.image == UIImage(named: "blue") || tileD3.image == UIImage(named: "yellow")) {
            tileD0.image = UIImage(named: "green")
            tileD1.image = tileD3.image
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && ((tileD1.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "yellow") && tileD3.image == UIImage(named: "blue")) || (tileD1.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "blue") && tileD3.image == UIImage(named: "yellow"))) {
            tileD0.image = tileD1.image
            tileD1.image = UIImage(named: "green")
            tileD2.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileD2.image == UIImage(named: "white") && ((tileD0.image == UIImage(named: "blue") && tileD1.image == UIImage(named: "yellow")) || (tileD0.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "blue"))) {
            tileD0.image = UIImage(named: "green")
            tileD1.image = tileD3.image
        }
        
        // MARK: TileGenerators
        
        if nextBlue == true {
            blueTileGenerator(range: numOfTiles)
        } else {
            yellowTileGenerator(range: numOfTiles)
        }
    }
    
// MARK: -SWIPEDOWN
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        
        // MARK: SwipeDown D-Column
        
        if tileD3.image == UIImage(named: "white") && tileD2.image == UIImage(named: "white") && tileD1.image == UIImage(named: "white"){
            tileD3.image = tileD0.image
            tileD2.image = UIImage(named: "white")
            tileD1.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") && tileD2.image == UIImage(named: "white") {
            tileD3.image = tileD1.image
            tileD2.image = tileD0.image
            tileD1.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") && tileD1.image == UIImage(named: "white"){
            tileD3.image = tileD2.image
            tileD2.image = tileD0.image
            tileD1.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") {
            tileD3.image = tileD2.image
            tileD2.image = tileD1.image
            tileD1.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileD2.image == UIImage(named: "white") && tileD1.image == UIImage(named: "white") {
            tileD2.image = tileD0.image
            tileD1.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileD1.image != UIImage(named: "white") && tileD2.image == UIImage(named: "white") {
            tileD2.image = tileD1.image
            tileD1.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileD2.image != UIImage(named: "white") && tileD1.image == UIImage(named: "white") {
            tileD1.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeDown D-Column (TO MAKE GREEN)
//        
//        if tileD1.image == UIImage(named: "white") && ((tileD3.image == UIImage(named: "blue") && tileD2.image == UIImage(named: "yellow")) || (tileD3.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "blue"))) {
//            tileD3.image = UIImage(named: "green")
//            tileD2.image = tileD0.image
//        }
//        if tileD3.image == tileD2.image && (tileD1.image != tileD3 && tileD1.image != UIImage(named: "white")) {
//            tileD2.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeDown C-Column
        
        if tileC3.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white"){
            tileC3.image = tileC0.image
            tileC2.image = UIImage(named: "white")
            tileC1.image = UIImage(named: "white")
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC3.image = tileC1.image
            tileC2.image = tileC0.image
            tileC1.image = UIImage(named: "white")
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white"){
            tileC3.image = tileC2.image
            tileC2.image = tileC0.image
            tileC1.image = UIImage(named: "white")
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image == UIImage(named: "white") {
            tileC3.image = tileC2.image
            tileC2.image = tileC1.image
            tileC1.image = tileC0.image
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC2.image = tileC0.image
            tileC1.image = UIImage(named: "white")
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image != UIImage(named: "white") && tileC1.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC2.image = tileC1.image
            tileC1.image = tileC0.image
            tileC0.image = UIImage(named: "white")
        } else if tileC3.image != UIImage(named: "white") && tileC2.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC1.image = tileC0.image
            tileC0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeDown C-Column (TO MAKE GREEN)
//        
//        if tileC1.image == UIImage(named: "white") && ((tileC3.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "yellow")) || (tileC3.image == UIImage(named: "yellow") && tileC2.image == UIImage(named: "blue"))) {
//            tileC3.image = UIImage(named: "green")
//            tileC2.image = tileC0.image
//        }
//        if tileC3.image == tileC2.image && (tileC1.image != tileC3 && tileC1.image != UIImage(named: "white")) {
//            tileC2.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeDown B-Column
        
        if tileB3.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white"){
            tileB3.image = tileB0.image
            tileB2.image = UIImage(named: "white")
            tileB1.image = UIImage(named: "white")
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB3.image = tileB1.image
            tileB2.image = tileB0.image
            tileB1.image = UIImage(named: "white")
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white"){
            tileB3.image = tileB2.image
            tileB2.image = tileB0.image
            tileB1.image = UIImage(named: "white")
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image == UIImage(named: "white") {
            tileB3.image = tileB2.image
            tileB2.image = tileB1.image
            tileB1.image = tileB0.image
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB2.image = tileB0.image
            tileB1.image = UIImage(named: "white")
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image != UIImage(named: "white") && tileB1.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB2.image = tileB1.image
            tileB1.image = tileB0.image
            tileB0.image = UIImage(named: "white")
        } else if tileB3.image != UIImage(named: "white") && tileB2.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB1.image = tileB0.image
            tileB0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeDown B-Column (TO MAKE GREEN)
//        
//        if tileB1.image == UIImage(named: "white") && ((tileB3.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "yellow")) || (tileB3.image == UIImage(named: "yellow") && tileB2.image == UIImage(named: "blue"))) {
//            tileB3.image = UIImage(named: "green")
//            tileB2.image = tileB0.image
//        }
//        if tileB3.image == tileB2.image && (tileB1.image != tileB3 && tileB1.image != UIImage(named: "white")) {
//            tileB2.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeDown A-Column
        
        if tileA3.image == UIImage(named: "white") && tileA2.image == UIImage(named: "white") && tileA1.image == UIImage(named: "white"){
            tileA3.image = tileA0.image
            tileA2.image = UIImage(named: "white")
            tileA1.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") && tileA2.image == UIImage(named: "white") {
            tileA3.image = tileA1.image
            tileA2.image = tileA0.image
            tileA1.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") && tileA1.image == UIImage(named: "white"){
            tileA3.image = tileA2.image
            tileA2.image = tileA0.image
            tileA1.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") {
            tileA3.image = tileA2.image
            tileA2.image = tileA1.image
            tileA1.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileA2.image == UIImage(named: "white") && tileA1.image == UIImage(named: "white") {
            tileA2.image = tileA0.image
            tileA1.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileA1.image != UIImage(named: "white") && tileA2.image == UIImage(named: "white") {
            tileA2.image = tileA1.image
            tileA1.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileA2.image != UIImage(named: "white") && tileA1.image == UIImage(named: "white") {
            tileA1.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeDown A-Column (TO MAKE GREEN)
//        
//        if tileA1.image == UIImage(named: "white") && ((tileA3.image == UIImage(named: "blue") && tileA2.image == UIImage(named: "yellow")) || (tileA3.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "blue"))) {
//            tileA3.image = UIImage(named: "green")
//            tileA2.image = tileA0.image
//        }
//        if tileA3.image == tileA2.image && (tileA1.image != tileA3 && tileA1.image != UIImage(named: "white")) {
//            tileA2.image = UIImage(named: "green")
//        }
        
        // MARK: TileGenerators
        
        if nextBlue == true {
            blueTileGenerator(range: numOfTiles)
        } else {
            yellowTileGenerator(range: numOfTiles)
        }
    }
    
// MARK: -SWIPELEFT
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {

        // MARK: SwipeLeft 0-Row
        
        if tileA0.image == UIImage(named: "white") && tileB0.image == UIImage(named: "white") && tileC0.image == UIImage(named: "white"){
            tileA0.image = tileD0.image
            tileB0.image = UIImage(named: "white")
            tileC0.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && tileB0.image == UIImage(named: "white") {
            tileA0.image = tileC0.image
            tileB0.image = tileD0.image
            tileC0.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") && tileC0.image == UIImage(named: "white"){
            tileA0.image = tileB0.image
            tileB0.image = tileD0.image
            tileC0.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image == UIImage(named: "white") {
            tileA0.image = tileB0.image
            tileB0.image = tileC0.image
            tileC0.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileB0.image == UIImage(named: "white") && tileC0.image == UIImage(named: "white") {
            tileB0.image = tileD0.image
            tileC0.image = UIImage(named: "white")
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileB0.image != UIImage(named: "white") && tileC0.image == UIImage(named: "white") {
            tileC0.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        } else if tileA0.image != UIImage(named: "white") && tileC0.image != UIImage(named: "white") && tileB0.image == UIImage(named: "white") {
            tileB0.image = tileC0.image
            tileC0.image = tileD0.image
            tileD0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeLeft 0-Row (TO MAKE GREEN)
//        
//        if tileC0.image == UIImage(named: "white") && ((tileA0.image == UIImage(named: "blue") && tileB0.image == UIImage(named: "yellow")) || (tileB0.image == UIImage(named: "yellow") && tileA0.image == UIImage(named: "blue"))) {
//            tileA0.image = UIImage(named: "green")
//            tileB0.image = tileD0.image
//        }
//        if tileA0.image == tileB0.image && (tileC0.image != tileA0 && tileC0.image != UIImage(named: "white")) {
//            tileB0.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeLeft 1-Row
        
        if tileA1.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white"){
            tileA1.image = tileD1.image
            tileB1.image = UIImage(named: "white")
            tileC1.image = UIImage(named: "white")
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileA1.image = tileC1.image
            tileB1.image = tileD1.image
            tileC1.image = UIImage(named: "white")
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white"){
            tileA1.image = tileB1.image
            tileB1.image = tileD1.image
            tileC1.image = UIImage(named: "white")
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image == UIImage(named: "white") {
            tileA1.image = tileB1.image
            tileB1.image = tileC1.image
            tileC1.image = tileD1.image
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileB1.image = tileD1.image
            tileC1.image = UIImage(named: "white")
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image != UIImage(named: "white") && tileB1.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC1.image = tileD1.image
            tileD1.image = UIImage(named: "white")
        } else if tileA1.image != UIImage(named: "white") && tileC1.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB1.image = tileC1.image
            tileC1.image = tileD1.image
            tileD1.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeLeft 1-Row (TO MAKE GREEN)
//        
//        if tileC1.image == UIImage(named: "white") && ((tileA1.image == UIImage(named: "blue") && tileB1.image == UIImage(named: "yellow")) || (tileB1.image == UIImage(named: "yellow") && tileA1.image == UIImage(named: "blue"))) {
//            tileA1.image = UIImage(named: "green")
//            tileB1.image = tileD1.image
//        }
//        if tileA1.image == tileB1.image && (tileC1.image != tileA1 && tileC1.image != UIImage(named: "white")) {
//            tileB1.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeLeft 2-Row
        
        if tileA2.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white"){
            tileA2.image = tileD2.image
            tileB2.image = UIImage(named: "white")
            tileC2.image = UIImage(named: "white")
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileA2.image = tileC2.image
            tileB2.image = tileD2.image
            tileC2.image = UIImage(named: "white")
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white"){
            tileA2.image = tileB2.image
            tileB2.image = tileD2.image
            tileC2.image = UIImage(named: "white")
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image == UIImage(named: "white") {
            tileA2.image = tileB2.image
            tileB2.image = tileC2.image
            tileC2.image = tileD2.image
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileB2.image = tileD2.image
            tileC2.image = UIImage(named: "white")
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image != UIImage(named: "white") && tileB2.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC2.image = tileD2.image
            tileD2.image = UIImage(named: "white")
        } else if tileA2.image != UIImage(named: "white") && tileC2.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB2.image = tileC2.image
            tileC2.image = tileD2.image
            tileD2.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeLeft 2-Row (TO MAKE GREEN)
//        
//        if tileC2.image == UIImage(named: "white") && ((tileA2.image == UIImage(named: "blue") && tileB2.image == UIImage(named: "yellow")) || (tileB2.image == UIImage(named: "yellow") && tileA2.image == UIImage(named: "blue"))) {
//            tileA2.image = UIImage(named: "green")
//            tileB2.image = tileD2.image
//        }
//        if tileA2.image == tileB2.image && (tileC2.image != tileA2 && tileC2.image != UIImage(named: "white")) {
//            tileB2.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeLeft 3-Row
        
        if tileA3.image == UIImage(named: "white") && tileB3.image == UIImage(named: "white") && tileC3.image == UIImage(named: "white"){
            tileA3.image = tileD3.image
            tileB3.image = UIImage(named: "white")
            tileC3.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") && tileB3.image == UIImage(named: "white") {
            tileA3.image = tileC3.image
            tileB3.image = tileD3.image
            tileC3.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") && tileC3.image == UIImage(named: "white"){
            tileA3.image = tileB3.image
            tileB3.image = tileD3.image
            tileC3.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image == UIImage(named: "white") {
            tileA3.image = tileB3.image
            tileB3.image = tileC3.image
            tileC3.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileB3.image == UIImage(named: "white") && tileC3.image == UIImage(named: "white") {
            tileB3.image = tileD3.image
            tileC3.image = UIImage(named: "white")
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileB3.image != UIImage(named: "white") && tileC3.image == UIImage(named: "white") {
            tileC3.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        } else if tileA3.image != UIImage(named: "white") && tileC3.image != UIImage(named: "white") && tileB3.image == UIImage(named: "white") {
            tileB3.image = tileC3.image
            tileC3.image = tileD3.image
            tileD3.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeLeft 3-Row (TO MAKE GREEN)
//        
//        if tileC3.image == UIImage(named: "white") && ((tileA3.image == UIImage(named: "blue") && tileB3.image == UIImage(named: "yellow")) || (tileB3.image == UIImage(named: "yellow") && tileA3.image == UIImage(named: "blue"))) {
//            tileA3.image = UIImage(named: "green")
//            tileB3.image = tileD3.image
//        }
//        if tileA3.image == tileB3.image && (tileC3.image != tileA3 && tileC3.image != UIImage(named: "white")) {
//            tileB3.image = UIImage(named: "green")
//        }
        
        // MARK: TileGenerators
        
        if nextBlue == true {
            blueTileGenerator(range: numOfTiles)
        } else {
            yellowTileGenerator(range: numOfTiles)
        }
    }
    
// MARK: -SWIPERIGHT
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {

        // MARK: SwipeRight 0-Row
        
        if tileD0.image == UIImage(named: "white") && tileC0.image == UIImage(named: "white") && tileB0.image == UIImage(named: "white"){
            tileD0.image = tileA0.image
            tileC0.image = UIImage(named: "white")
            tileB0.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && tileC0.image == UIImage(named: "white") {
            tileD0.image = tileB0.image
            tileC0.image = tileA0.image
            tileB0.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") && tileB0.image == UIImage(named: "white"){
            tileD0.image = tileC0.image
            tileC0.image = tileA0.image
            tileB0.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image == UIImage(named: "white") {
            tileD0.image = tileC0.image
            tileC0.image = tileB0.image
            tileB0.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileC0.image == UIImage(named: "white") && tileB0.image == UIImage(named: "white") {
            tileC0.image = tileA0.image
            tileB0.image = UIImage(named: "white")
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileC0.image != UIImage(named: "white") && tileB0.image == UIImage(named: "white") {
            tileB0.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        } else if tileD0.image != UIImage(named: "white") && tileB0.image != UIImage(named: "white") && tileC0.image == UIImage(named: "white") {
            tileC0.image = tileB0.image
            tileB0.image = tileA0.image
            tileA0.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeRight 0-Row (TO MAKE GREEN)
//        
//        if tileB0.image == UIImage(named: "white") && ((tileD0.image == UIImage(named: "blue") && tileC0.image == UIImage(named: "yellow")) || (tileC0.image == UIImage(named: "yellow") && tileD0.image == UIImage(named: "blue"))) {
//            tileD0.image = UIImage(named: "green")
//            tileC0.image = tileA0.image
//        }
//        if tileD0.image == tileC0.image && (tileB0.image != tileD0 && tileB0.image != UIImage(named: "white")) {
//            tileC0.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeRight 1-Row
        
        if tileD1.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white"){
            tileD1.image = tileA1.image
            tileC1.image = UIImage(named: "white")
            tileB1.image = UIImage(named: "white")
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image == UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileD1.image = tileB1.image
            tileC1.image = tileA1.image
            tileB1.image = UIImage(named: "white")
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white"){
            tileD1.image = tileC1.image
            tileC1.image = tileA1.image
            tileB1.image = UIImage(named: "white")
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image == UIImage(named: "white") {
            tileD1.image = tileC1.image
            tileC1.image = tileB1.image
            tileB1.image = tileA1.image
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileC1.image = tileA1.image
            tileB1.image = UIImage(named: "white")
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image != UIImage(named: "white") && tileC1.image != UIImage(named: "white") && tileB1.image == UIImage(named: "white") {
            tileB1.image = tileA1.image
            tileA1.image = UIImage(named: "white")
        } else if tileD1.image != UIImage(named: "white") && tileB1.image != UIImage(named: "white") && tileC1.image == UIImage(named: "white") {
            tileC1.image = tileB1.image
            tileB1.image = tileA1.image
            tileA1.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeRight 1-Row (TO MAKE GREEN)
//        
//        if tileB1.image == UIImage(named: "white") && ((tileD1.image == UIImage(named: "blue") && tileC1.image == UIImage(named: "yellow")) || (tileC1.image == UIImage(named: "yellow") && tileD1.image == UIImage(named: "blue"))) {
//            tileD1.image = UIImage(named: "green")
//            tileC1.image = tileA1.image
//        }
//        if tileD1.image == tileC1.image && (tileB1.image != tileD1 && tileB1.image != UIImage(named: "white")) {
//            tileC1.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeRight 2-Row
        
        if tileD2.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white"){
            tileD2.image = tileA2.image
            tileC2.image = UIImage(named: "white")
            tileB2.image = UIImage(named: "white")
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image == UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileD2.image = tileB2.image
            tileC2.image = tileA2.image
            tileB2.image = UIImage(named: "white")
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white"){
            tileD2.image = tileC2.image
            tileC2.image = tileA2.image
            tileB2.image = UIImage(named: "white")
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image == UIImage(named: "white") {
            tileD2.image = tileC2.image
            tileC2.image = tileB2.image
            tileB2.image = tileA2.image
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileC2.image = tileA2.image
            tileB2.image = UIImage(named: "white")
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image != UIImage(named: "white") && tileC2.image != UIImage(named: "white") && tileB2.image == UIImage(named: "white") {
            tileB2.image = tileA2.image
            tileA2.image = UIImage(named: "white")
        } else if tileD2.image != UIImage(named: "white") && tileB2.image != UIImage(named: "white") && tileC2.image == UIImage(named: "white") {
            tileC2.image = tileB2.image
            tileB2.image = tileA2.image
            tileA2.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeRight 2-Row (TO MAKE GREEN)
//        
//        if tileB2.image == UIImage(named: "white") && ((tileD2.image == UIImage(named: "blue") && tileC2.image == UIImage(named: "yellow")) || (tileC2.image == UIImage(named: "yellow") && tileD2.image == UIImage(named: "blue"))) {
//            tileD2.image = UIImage(named: "green")
//            tileC2.image = tileA2.image
//        }
//        if tileD2.image == tileC2.image && (tileB2.image != tileD2 && tileB2.image != UIImage(named: "white")) {
//            tileC2.image = UIImage(named: "green")
//        }
        
        // MARK: SwipeRight 3-Row
        
        if tileD3.image == UIImage(named: "white") && tileC3.image == UIImage(named: "white") && tileB3.image == UIImage(named: "white"){
            tileD3.image = tileA3.image
            tileC3.image = UIImage(named: "white")
            tileB3.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") && tileC3.image == UIImage(named: "white") {
            tileD3.image = tileB3.image
            tileC3.image = tileA3.image
            tileB3.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") && tileB3.image == UIImage(named: "white"){
            tileD3.image = tileC3.image
            tileC3.image = tileA3.image
            tileB3.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image == UIImage(named: "white") {
            tileD3.image = tileC3.image
            tileC3.image = tileB3.image
            tileB3.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileC3.image == UIImage(named: "white") && tileB3.image == UIImage(named: "white") {
            tileC3.image = tileA3.image
            tileB3.image = UIImage(named: "white")
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileC3.image != UIImage(named: "white") && tileB3.image == UIImage(named: "white") {
            tileB3.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        } else if tileD3.image != UIImage(named: "white") && tileB3.image != UIImage(named: "white") && tileC3.image == UIImage(named: "white") {
            tileC3.image = tileB3.image
            tileB3.image = tileA3.image
            tileA3.image = UIImage(named: "white")
        }
        
//        // MARK: SwipeRight 3-Row (TO MAKE GREEN)
//        
//        if tileB3.image == UIImage(named: "white") && ((tileD3.image == UIImage(named: "blue") && tileC3.image == UIImage(named: "yellow")) || (tileC3.image == UIImage(named: "yellow") && tileD3.image == UIImage(named: "blue"))) {
//            tileD3.image = UIImage(named: "green")
//            tileC3.image = tileA3.image
//        }
//        if tileD3.image == tileC3.image && (tileB3.image != tileD3 && tileB3.image != UIImage(named: "white")) {
//            tileC3.image = UIImage(named: "green")
//        }
        
        // MARK: TileGenerators
        
        if nextBlue == true {
            blueTileGenerator(range: numOfTiles)
        } else {
            yellowTileGenerator(range: numOfTiles)
        }
    }
    func blueTileGenerator(range: Int) {
        for index in 0...15 {
            if boardArray[index].image == UIImage(named: "green") {
                UIImageView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, animations: {self.boardArray[index].image = UIImage(named: "white")}, completion: nil)
                score += 1
                scoreField.text = String(score)
            }
        }
        var random = Int(arc4random_uniform(UInt32(range)))
        while boardArray[random].image == UIImage(named: "blue") || boardArray[random].image == UIImage(named: "yellow") {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        boardArray[random].image = UIImage(named: "white")
        UIImageView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, animations: {self.boardArray[random].image = UIImage(named: "blue")}, completion: nil)
        nextBlue = false
    }
    func yellowTileGenerator(range: Int) {
        for index in 0...15 {
            if boardArray[index].image == UIImage(named: "green") {
                UIImageView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, animations: {self.boardArray[index].image = UIImage(named: "white")}, completion: nil)
                score += 1
                scoreField.text = String(score)
            }
        }
        var random = Int(arc4random_uniform(UInt32(range)))
        while boardArray[random].image == UIImage(named: "blue") || boardArray[random].image == UIImage(named: "yellow") {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        boardArray[random].image = UIImage(named: "white")
        UIImageView.animate(withDuration: 1.0, delay: 1.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, animations: {self.boardArray[random].image = UIImage(named: "yellow")}, completion: nil)
        nextBlue = true
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
