//
//  ViewController.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import UIKit

class TabBarController: UITabBarController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            changeRadiusOfTabbar()
            changeUnSelectedColor()
        }
        
        
        override func viewDidLayoutSubviews() {
            changeHeightOfTabbar()
            
        }
        
        
        func changeRadiusOfTabbar(){
            
            self.tabBar.layer.masksToBounds = true
            self.tabBar.isTranslucent = true
            self.tabBar.layer.cornerRadius = 60
            self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        }
        
        func changeUnSelectedColor(){
            
            self.tabBar.unselectedItemTintColor = UIColor.white
        }
        
        func changeHeightOfTabbar(){
            
            if UIDevice().userInterfaceIdiom == .phone {
                var tabFrame            = tabBar.frame
                tabFrame.size.height    = 100
                tabFrame.origin.y       = view.frame.size.height - 75
                tabBar.frame            = tabFrame
            }
            
        }
        
        
        override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            SimpleAnnimationWhenSelectItem(item)
        }
        
        func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem){
            guard let barItemView = item.value(forKey: "view") as? UIView else { return }
            
            let timeInterval: TimeInterval = 0.2
            let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
                barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }
            propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
            propertyAnimator.startAnimation()
        }
        
        
        
    }

