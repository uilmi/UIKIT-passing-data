//
//  DuaViewController.swift
//  UIKIT-passing-data
//
//  Created by Ulul I. on 25/10/22.
//

import UIKit


// Completion handler model

class DuaViewController: UIViewController {

    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name - "
        
        return label
    }()
    
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: 100)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Set Name", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("custom"), object: nil, queue: .main, using: { notification in
            
            guard let object = notification.object as? [String: UIColor] else {
                return
            }
            
            guard let color = object["color"] else {
                return
            }
            
            self.view.backgroundColor = color
            
        })
        
        
    }
    

    @objc private func didTapButton() {
        
        let textEntry = TextEntryViewController()
        textEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        let vc = UINavigationController(rootViewController: textEntry)
        present(vc, animated: true)
    }
}
