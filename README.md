# dismissViewTest

There is something wrong with NavigationLink in the swiftui framework. 
If you create child views and try to exit them with calls like self.presentationMode.wrappedValue.dismiss() it works on iPhones, but not iPads.

There is a stackoverflow post that shows multiple ways to programmatically leave child views:
https://stackoverflow.com/questions/56513568/ios-swiftui-pop-or-dismiss-view-programmatically

The first two options demonstrate variants of the problem that I found.
The third option, which uses the https://github.com/matteopuc/swiftui-navigation-stack framework works on iPhones and iPads

This project implements all three options (with /* */ to select which option is live)
