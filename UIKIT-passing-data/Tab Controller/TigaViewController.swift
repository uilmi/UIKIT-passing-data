//
//  TigaViewController.swift
//  UIKIT-passing-data
//
//  Created by Ulul I. on 25/10/22.
//

import UIKit

class TigaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("Fire event!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
    }
    
    @objc private func didTapButton() {
        NotificationCenter.default.post(name: Notification.Name("custom"),
                                        object: ["color": UIColor.red])
    }

}
