//
//  Resources.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 27/02/23.
//

import UIKit

enum Resources {
    enum Colors {
        enum TabBarColors {
            //через static мы можем обратиться к элементу не создавая экземпляр класса
            static var active = UIColor(hexString: "#437BFE")
            static var inactive = UIColor(hexString: "#929DA5")
            static var separator = UIColor(hexString: "#E8ECEF")
        }
    }
    
    enum Strings {
        enum TabBarStrings {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }

    }

    enum Image {
        enum TabBarImage {
            static var overview = UIImage(named: "Overview_tab")
            static var session = UIImage(named: "Session_tab")
            static var progress = UIImage(named: "Progress_tab")
            static var settings = UIImage(named: "Settings_tab")
        }
    }
}
