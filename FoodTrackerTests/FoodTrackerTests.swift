//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Max McArthur on 8/5/17.
//  Copyright © 2017 Max McArthur. All rights reserved.
//

import XCTest
@testable import FoodTracker


class FoodTrackerTests: XCTestCase {
    // MARK: Meal class tests
    func testMealInitializationSucceeds() {
        let ZeroRatingMeal = Meal.init(name: "Zero", image: nil, rating: 0)
        XCTAssertNotNil(ZeroRatingMeal)
        let FiveRatingMeal = Meal.init(name: "Five", image: nil, rating: 5)
        XCTAssertNotNil(FiveRatingMeal)
    }
    
    func testMealInitializationFails() {
        let NegativeRatingMeal = Meal.init(name: "Neg", image: nil, rating: -1)
        XCTAssertNil(NegativeRatingMeal)
        
        let EmptyNameMeal = Meal.init(name: "", image: nil, rating: 0)
        XCTAssertNil(EmptyNameMeal)
    }
}
