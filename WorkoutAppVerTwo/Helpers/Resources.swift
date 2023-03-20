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
        enum NavBarColors {
            static var titleGray = UIColor(hexString: "#545C77")
            static var separatorNav = UIColor(hexString: "#E8ECEF")
            static var secondary = UIColor(hexString: "#F0F3FF")
        }
        enum BaseController {
            static var baseBackgroundColor = UIColor(hexString: "#F8F9F9")
            static var navBarButtonColorActiv = UIColor(hexString: "#437BFE")
            static var navBarButtonColorInactive = UIColor(hexString: "#929DA5")
        }
    }
    
    enum Strings {
        enum TabBarStrings {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
        enum Session {
            static var navBarLeft = "Pause"
            static var navBarRight = "Finish"
        }
        enum Progress {
            static var navBarLeft = "Export"
            static var navBarRight = "Details"
        }

        enum OverView {
            static var allWorkoutsButton = "All Workouts"
        }

    }

    enum Fonts {
            //используем функцию что бы мы могли задавать размер в другом месте
            static func helveticaRegular (with size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica", size: size) ?? UIFont()
            }
        }

    enum Image {
        enum TabBarImage {
            static var overview = UIImage(named: "Overview_tab")
            static var session = UIImage(named: "Session_tab")
            static var progress = UIImage(named: "Progress_tab")
            static var settings = UIImage(named: "Settings_tab")
        }
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var add = UIImage(named: "add_Button")
        }
    }
}
