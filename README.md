# Pulse Insights iOS SDK Demo app

This demo application showcases the integration and usage of the [PulseInsights SDK](https://github.com/Pulse-Insights/pi-ios-spm) for iOS. It demonstrates various features including survey triggering, context data management, and client key configuration.

## Getting Started
### Prerequisites
Xcode 14.0+
iOS 13.0+
Swift 5.0+
### Installation
1. Clone this repository
2. Open the project in Xcode
3. Build and run the application on your device or simulator

## Usage
### Step 1: Obtain an Account ID
First, you need to obtain an Account ID from the Pulse Insights Console:
1. Log in to your Pulse Insights Console
2. Navigate to Account Settings
3. Copy your Account ID

### Step 2: Initialize the SDK
In `AppDelegate.swift`, initialize the PulseInsights SDK with your Account ID:

```swift
import UIKit
import PulseInsights

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var pulseInsights: PulseInsights?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize PulseInsights with your Account ID
        let accountId = "YOUR_ACCOUNT_ID"
        pulseInsights = PulseInsights(accountId, enableDebugMode: true)
        
        // Optional: Set custom host if needed
        // pulseInsights?.setHost("survey.pulseinsights.com")
        
        // Optional: Set custom data
        let customData = ["user_type": "tester", "platform": "iOS"]
        pulseInsights?.setContextData(customData)
        
        return true
    }
}
```

### Step 3: Trigger Surveys

To trigger surveys in your application:

```swift
// In your view controller
import PulseInsights

class YourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view name for targeting
        PulseInsights.getInstance.setViewName("mainView", controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Serve the survey
        PulseInsights.getInstance.serve()
    }
}
```

### Step 4: Set Client Key (Optional)

If you need to set a client key for specific surveys:

```swift
// Set the client key
PulseInsights.getInstance.setClientKey("YOUR_CLIENT_KEY")
```

### Step 5: Manage Context Data (Optional)

You can add context data to provide additional information for survey targeting:

```swift
// Add context data
let contextData = ["user_id": "12345", "subscription_level": "premium"]
PulseInsights.getInstance.setContextData(contextData)

// Clear context data
PulseInsights.getInstance.clearContextData()
```

## Features Demonstrated in the App

- Survey triggering in different views
- Inline surveys
- Context data management
- Client key configuration
- Survey response checking
- Device ID reset

## Documentation
For more detailed information about the PulseInsights SDK, please refer to the [official documentation](https://github.com/Pulse-Insights/pi-ios-spm).

## License
This project is licensed under the MIT License - see the LICENSE file for details.
