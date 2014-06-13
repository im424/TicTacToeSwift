//
//  AppDelegate.swift
//  TicTacToeSwift
//
//  Created by To Kin Hang on 6/6/14.
//  Copyright (c) 2014 To Kin Hang. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
	
	@IBOutlet var window: NSWindow
	
	@IBOutlet var B0 : NSButton
	@IBOutlet var B1 : NSButton
	@IBOutlet var B2 : NSButton
	@IBOutlet var B3 : NSButton
	@IBOutlet var B4 : NSButton
	@IBOutlet var B5 : NSButton
	@IBOutlet var B6 : NSButton
	@IBOutlet var B7 : NSButton
	@IBOutlet var B8 : NSButton

	var borad :String[] = ["","","","","","","","",""];
	var player:String = "X";
	
	@IBAction func resetButton(sender : AnyObject) {
		resetBoard()
	}
	

	@IBAction func userInput(sender : AnyObject) {
		
		if sender.title != "X" && sender.title != "O"{
			sender.setTitle(player)
		//	NSLog("%d",sender.tag());
			borad[sender.tag()] = player
			if checkGameIsEnd(){
				let myPopup:NSAlert = NSAlert()
				 myPopup.messageText = "\(player) Wins";
				myPopup.runModal()
				resetBoard()
			}
			switchPlayer()
		}
	}

	func applicationDidFinishLaunching(aNotification: NSNotification?) {
		// Insert code here to initialize your application
		
	}

	func applicationWillTerminate(aNotification: NSNotification?) {
		// Insert code here to tear down your application
	}
	
	func checkGameIsEnd() -> Bool {
		var rowCount = 0
		
		for i in 0...2{
			rowCount = 0
			for j in 0...2{
				if borad[i*3+j] == player {
					rowCount++
				}
			}
		}
		
		if rowCount == 3 {
			return true
		}
		
		
		
		for j in 0...2{
			rowCount = 0
			for i in 0...2{
				if borad[i*3+j] == player {
					rowCount++
				}
			}
		}
		if rowCount == 3 {
			return true
		}
		
		if borad[0] == borad[4] && borad[4] == borad[8] &&  borad[4] == player {
			return true
		}
		if borad[2] == borad[4] && borad[4] == borad[6] &&  borad[4] == player {
			return true
		}
		return false
	}
	
	func switchPlayer()  {
		
		if player == "X" {
			 player = "O"
			
		}else{
		 player = "X"
		}
		//NSLog("Switch to \(player) ");
	}

	func resetBoard (){
		for i in 0...8 {
			borad[i] = ""
			
			}
		B0.title = ""
		B1.title = ""
		B2.title = ""
		B3.title = ""
		B4.title = ""
		B5.title = ""
		B6.title = ""
		B7.title = ""
		B8.title = ""
		
	}

}

