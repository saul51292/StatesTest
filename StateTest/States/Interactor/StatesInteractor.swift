//
//  StatesInteractor.swift
//  StateTest
//
//  Created by Saul Hamadani on 8/18/20.
//  Copyright © 2020 Saul Hamadani. All rights reserved.
//

import Foundation

class StatesInteractor {
    fileprivate let _states: [State]
    
    init() {
        //add dependencies here
        //do startup stuff here
        self._states = [State(abbreviation: "AK", name: "Alaska"),
                      State(abbreviation: "AL", name: "Alabama"),
                      State(abbreviation: "AR", name: "Arkansas"),
                      State(abbreviation: "AS", name: "American Samoa"),
                      State(abbreviation: "AZ", name: "Arizona"),
                      State(abbreviation: "CA", name: "California"),
                      State(abbreviation: "CO", name: "Colorado"),
                      State(abbreviation: "CT", name: "Connecticut"),
                      State(abbreviation: "DC", name: "District of Columbia"),
                      State(abbreviation: "DE", name: "Delaware"),
                      State(abbreviation: "FL", name: "Florida"),
                      State(abbreviation: "GA", name: "Georgia"),
                      State(abbreviation: "GU", name: "Guam"),
                      State(abbreviation: "HI", name: "Hawaii"),
                      State(abbreviation: "IA", name: "Iowa"),
                      State(abbreviation: "ID", name: "Idaho"),
                      State(abbreviation: "IL", name: "Illinois"),
                      State(abbreviation: "IN", name: "Indiana"),
                      State(abbreviation: "KS", name: "Kansas"),
                      State(abbreviation: "KY", name: "Kentucky"),
                      State(abbreviation: "LA", name: "Louisiana"),
                      State(abbreviation: "MA", name: "Massachusetts"),
                      State(abbreviation: "MD", name: "Maryland"),
                      State(abbreviation: "ME", name: "Maine"),
                      State(abbreviation: "MI", name: "Michigan"),
                      State(abbreviation: "MN", name: "Minnesota"),
                      State(abbreviation: "MO", name: "Missouri"),
                      State(abbreviation: "MS", name: "Mississippi"),
                      State(abbreviation: "MT", name: "Montana"),
                      State(abbreviation: "NC", name: "North Carolina"),
                      State(abbreviation: "ND", name: "North Dakota"),
                      State(abbreviation: "NE", name: "Nebraska"),
                      State(abbreviation: "NH", name: "New Hampshire"),
                      State(abbreviation: "NJ", name: "New Jersey"),
                      State(abbreviation: "NM", name: "New Mexico"),
                      State(abbreviation: "NV", name: "Nevada"),
                      State(abbreviation: "NY", name: "New York"),
                      State(abbreviation: "OH", name: "Ohio"),
                      State(abbreviation: "OK", name: "Oklahoma"),
                      State(abbreviation: "OR", name: "Oregon"),
                      State(abbreviation: "PA", name: "Pennsylvania"),
                      State(abbreviation: "PR", name: "Puerto Rico"),
                      State(abbreviation: "RI", name: "Rhode Island"),
                      State(abbreviation: "SC", name: "South Carolina"),
                      State(abbreviation: "SD", name: "South Dakota"),
                      State(abbreviation: "TN", name: "Tennessee"),
                      State(abbreviation: "TX", name: "Texas"),
                      State(abbreviation: "UT", name: "Utah"),
                      State(abbreviation: "VA", name: "Virginia"),
                      State(abbreviation: "VI", name: "Virgin Islands"),
                      State(abbreviation: "VT", name: "Vermont"),
                      State(abbreviation: "WA", name: "Washington"),
                      State(abbreviation: "WI", name: "Wisconsin"),
                      State(abbreviation: "WV", name: "West Virginia"),
                      State(abbreviation: "WY", name: "Wyoming")]
    }
}

private extension StatesInteractor {
    //put any private functions here
}

extension StatesInteractor: StatesInteractorType {
    var states: [State] {
        return self._states
    }
}
