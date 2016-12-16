//
//  UIApplication.swift
//  OXKit
//
//  Created by Dmitriy on 29.03.16.
//
//

import UIKit


/// Animation type of change root view controller
///
/// - none: without animation
/// - transitionCrossDissolve: A transition that dissolves from one view to the next.
/// - scale: Custom scale transition
public enum ChangeRootViewControllerAnimation {
    case none
    case transitionCrossDissolve
    case scale
}

extension UIApplication {
    public func switchRootViewController(_ window: UIWindow?, rootViewController: UIViewController, animation: ChangeRootViewControllerAnimation, completion: (() -> Void)?) {
        if let window = window {
            
            switch animation {
            case .none:
                window.rootViewController = rootViewController
            case .transitionCrossDissolve:
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window.rootViewController = rootViewController
                    UIView.setAnimationsEnabled(oldState)
                    }, completion: { (finished: Bool) -> () in
                        completion?()
                })
            case .scale:
                let snapshot: UIView = window.snapshotView(afterScreenUpdates: true)!
                rootViewController.view.addSubview(snapshot);
                
                window.rootViewController = rootViewController;
                
                UIView.animate(withDuration: 0.5, animations: {() in
                    snapshot.layer.opacity = 0;
                    snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
                    }, completion: {
                        (value: Bool) in
                        snapshot.removeFromSuperview();
                        completion?()
                });
            }
        }
    }
}
