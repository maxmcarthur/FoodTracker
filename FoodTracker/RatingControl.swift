//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Max McArthur on 8/5/17.
//  Copyright © 2017 Max McArthur. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // MARK: Properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonStates()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width:44.0, height:44.0) {
        didSet {
            setupButtons()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Private Methods
    
    private func setupButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of:self))
        let filledStar = UIImage(named: "Filled Star", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "Empty Star", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "Highlighted Star", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            let button = UIButton()
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonStates()
    }
    
    // MARK: Button Actions
    @objc func ratingButtonTapped(button: UIButton) {
        guard let pressedRating = ratingButtons.index(of: button) else {
            fatalError("Received button press for nonexistent button.")
        }
        
        let selectedRating = pressedRating + 1
        
        if (selectedRating == rating) {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    private func updateButtonStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
}
