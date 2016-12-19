//
//  UIApplication.swift
//  OXKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Dmitriy Azarov. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit


/// Animation type of change root view controller
///
/// - none: without animation
/// - transitionCrossDissolve: A transition that dissolves from one view to the next.
/// - scale: Custom scale transition
public enum ChangeRootViewControllerAnimation {
    case none
    case transitionCrossDissolve
    case transitionFlipFromRight
    case scale
}

extension UIApplication {
    public func switchRootViewController(_ window: UIWindow?, rootViewController: UIViewController, animation: ChangeRootViewControllerAnimation, completion: (() -> Void)?) {
        if let window = window {
            
            switch animation {
            case .none:
                window.rootViewController = rootViewController
            case .transitionFlipFromRight:
                UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    window.rootViewController = rootViewController
                    UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    completion?()
                })

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
