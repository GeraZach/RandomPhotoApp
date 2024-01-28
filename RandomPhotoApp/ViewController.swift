//
//  ViewController.swift
//  RandomPhotoApp
//
//  Created by George on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("New Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 1, y: 1, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemMint,
        .systemIndigo
    ]
    
    @objc func didTapButton() {
        getRandomPhoto()
        var newColor = colors.randomElement()
        while view.backgroundColor == newColor{
            newColor = colors.randomElement()
        }
        view.backgroundColor = newColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
        
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    


}

