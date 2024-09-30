import SwiftUI
import UIKit

func configureNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.titleTextAttributes = [
        .foregroundColor: UIColor.defaultWhite,
    ]
    UINavigationBar.appearance().standardAppearance = appearance
}
