//
//  Extensions.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    /// Show indicator
    func showIndicator() {
        IndicatorView.addIndicatorToView(View: self.view)
    }
    
    /// Hide indicator
    func hideIndicator() {
        DispatchQueue.main.async { [self] in
            IndicatorView.removeIndicatiorView(View: self.view)
        }
        
    }
}

//MARK: - Get AppStoryboard Extension
enum AppStoryboard : String {
    case Main
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
