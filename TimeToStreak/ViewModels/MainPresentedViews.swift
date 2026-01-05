//
//  MainPresentedViews.swift
//  TimeToStreak
//
//  Created by Will Habos on 1/4/26.
//

import Observation
import Foundation
import SwiftUI
import UIKit

@MainActor
@Observable
final class MainPresentedViews {
    
    var currentView: PageView = .homeView
    
    enum PageView {
        
        case homeView,
             streaksView,
             goalsView,
             settingsView,
             createStreaksView
        
    }
    
}
