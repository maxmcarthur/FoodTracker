//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Max McArthur on 8/5/17.
//  Copyright © 2017 Max McArthur. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealRating: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
