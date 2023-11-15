//
//  ViewController.swift
//  VascommMobile
//
//  Created by Muhammad Affan on 15/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        enableTapGestureOnView()
        addKeyboardObserver()
    }
    
    func enableTapGestureOnView(cancelsTouchesInView: Bool = false) {
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.tapClick(_:)))
        view.isUserInteractionEnabled = true
        tap.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(tap)
    }
    
    @objc func tapClick(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Navigation Items

extension ViewController {
    
    func addRightBarButtonItem(image: UIImage?, tintColor: UIColor? = nil, action: Selector) {
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 24, height: 24)
        button.setImage(image, for: .normal)
        if let tintColor = tintColor {
            button.tintColor = tintColor
        }
        button.addTarget(self, action: action, for: .touchUpInside)
        if let item = navigationItem.rightBarButtonItems, item.count > 0 {
            var items = [UIBarButtonItem(customView: button)]
            items.append(contentsOf: item)
            navigationItem.rightBarButtonItems = items
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func addLeftBarButtonItem(image: UIImage?, tintColor: UIColor? = nil, action: Selector) {
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 24, height: 24)
        button.setImage(image, for: .normal)
        if let tintColor = tintColor {
            button.tintColor = tintColor
        }
        button.addTarget(self, action: action, for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        item.customView?.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func addCartItemBarButton() {
        addRightBarButtonItem(image: .icCart, action: #selector(tapCartButton))
    }
    
    func addNotificationItemBarButton() {
        addRightBarButtonItem(image: .icBell, action: #selector(tapNotificationButton))
    }
    
    @objc func tapCartButton() {}
    
    @objc func tapNotificationButton() {}
    
}

// MARK: - Keyboard Observer

extension ViewController {
    
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {}
    
    @objc func keyboardShow(notification: Notification) {}
    
    @objc func keyboardWillHidden(notification: Notification) {}
    
}
