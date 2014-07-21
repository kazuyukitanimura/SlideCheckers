//
//  GameScene.swift
//  SlideCheckers
//
//  Created by Kazuyuki Tanimura on 7/20/14.
//  Copyright (c) 2014 Kazuyuki Tanimura. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let screenWidth: CGFloat = UIScreen.mainScreen().bounds.width * UIScreen.mainScreen().scale
    
    var slider: SKSpriteNode!
    var touchX: CGFloat!
    var speedX: CGFloat!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "Hello, World!";
        //myLabel.fontSize = 65;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        //self.addChild(myLabel)
        self.backgroundColor = SKColor(red: 81.0/255.0, green: 192.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        
        slider = SKSpriteNode(imageNamed:"Spaceship")
        slider.setScale(0.5)
        slider.position = CGPoint(x:slider.size.width, y:3 * self.frame.size.height / 4)
        speedX = 1.0
        self.addChild(slider)
        
        //let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        //slider.runAction(SKAction.repeatActionForever(action))
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            touchX = location.x
        }
        speedX = 0.0
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            slider.position.x = moveSlider(location.x - touchX)
            touchX = location.x
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        speedX = 1.0
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        slider.position.x = moveSlider(speedX)
    }
    
    func moveSlider(deltaX: CGFloat) ->CGFloat {
        return slider.size.width + (slider.position.x + deltaX - slider.size.width) % screenWidth
    }
}
