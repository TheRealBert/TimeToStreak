//
//  UserInputPresentedViews.swift
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
final class UserInputPresentedViews {
    
    var currentView: PageView = .goalView
    
    enum PageView {
        
        case goalView,
             streakOptionView,
             reviewLaunchView
        
    }
    
}
