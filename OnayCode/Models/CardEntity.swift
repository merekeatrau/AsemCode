//
//  CardEntity.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import Foundation
import UIKit

struct Card {
    var progress: String
    var header: String
    var subheader: String
    var bgImage: UIImage?
}

let cardInfo = [
    Card(progress: "51", header: "Level 1", subheader: "Basic", bgImage: UIImage(named: "level1")),
    Card(progress: "0", header: "Level 2", subheader: "Basic", bgImage: UIImage(named: "level2")),
    Card(progress: "0", header: "Level 3", subheader: "Basic", bgImage: UIImage(named: "level3")),
    Card(progress: "0", header: "Level 4", subheader: "Pre-Intermediate", bgImage: UIImage(named: "level4")),
    Card(progress: "0", header: "Level 5", subheader: "Pre-Intermediate", bgImage: UIImage(named: "level5"))
]
