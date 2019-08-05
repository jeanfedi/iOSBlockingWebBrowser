# iOSBlockingWebBrowser
A simple application to block tracking services over web (in this example, Facebook)
This example blocks FacebookAnalytics tracking, but can easily extender to every tracker.
## How to use it
The core of the project is the **BlockerConfiguration** class, which provides the specific `WKWebView` configuration for the blocker.
The blocker configuration is in the `blockTrackers.json` file and it can be extended for every tracker.

