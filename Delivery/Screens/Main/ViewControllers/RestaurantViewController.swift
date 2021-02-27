//
//  RestaurantViewController.swift
//  Delivery
//
//  Created by Øyvind Hauge on 19/02/2021.
//

import UIKit

final class RestaurantViewController: UIViewController {
    
    func didFinishInput(_ input: String) {
        print(input)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupChildViews() {
    }
}
