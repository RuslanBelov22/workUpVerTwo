//
//  Resources.swift
//  WorkoutAppVerTwo
//
//  Created by Белов Руслан on 27/02/23.
//

import UIKit

enum R {
    enum Colors {
        enum TabBarColors {
            //через static мы можем обратиться к элементу не создавая экземпляр класса
            static let active = UIColor(hexString: "#437BFE")
            static let inactive = UIColor(hexString: "#929DA5")
            static let separator = UIColor(hexString: "#E8ECEF")
            //если мы пишем через var то можем использовать вычисляемое св-во которое не инициализируется до того как ты к нему обратишься 
        }
        enum NavBarColors {
            static let titleGray = UIColor(hexString: "#545C77")
            static let separatorNav = UIColor(hexString: "#E8ECEF")
            static let secondary = UIColor(hexString: "#F0F3FF")
        }
        enum BaseController {
            static let baseBackgroundColor = UIColor(hexString: "#F8F9F9")
            static let navBarButtonColorActiv = UIColor(hexString: "#437BFE")
            static let navBarButtonColorInactive = UIColor(hexString: "#929DA5")
        }
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }

        enum NavBar {
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
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
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "Overview_tab")
                case .session: return UIImage(named: "Session_tab")
                case .progress: return UIImage(named: "Progress_tab")
                case .settings: return UIImage(named: "Settings_tab")
                }
            }
//            static var overview = UIImage(named: "Overview_tab")
//            static var session = UIImage(named: "Session_tab")
//            static var progress = UIImage(named: "Progress_tab")
//            static var settings = UIImage(named: "Settings_tab")
        }
        enum Common {
            static var downArrow = UIImage(named: "down_arrow")
            static var add = UIImage(named: "add_Button")
        }
    }
}
