//
//  Meal.swift
//  FoodTracker
//
//  Created by Max McArthur on 8/5/17.
//  Copyright © 2017 Max McArthur. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var rating: Int
    var image: UIImage?
    
    // MARK: Initializers
    init?(name: String, image: UIImage?, rating: Int) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.rating = rating
        self.image = image
    }
}
