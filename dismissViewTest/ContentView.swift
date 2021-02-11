//
//  ContentView.swift
//  dismissViewTest
//
//  Created by Paul on 2/7/21.
//

import SwiftUI
import NavigationStack

// https://stackoverflow.com/questions/56513568/ios-swiftui-pop-or-dismiss-view-programmatically

/*

// This version works on iPhones but not iPads (similar to my project)
struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(
            "Here is Detail View. Tap to go back.",
            action: { self.presentationMode.wrappedValue.dismiss() }
        )
    }
}

struct RootView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: DetailView())
            { Text("I am Root. Tap for Detail View.") }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            RootView()
        }
    }
}
*/

/*
// This version also only works on iPhones - not on iPads
struct ContentView: View {
    var body: some View {
        NavigationView {
            MasterView()
        }
    }
}

struct MasterView: View {
    @State private var showDetail = false

    var body: some View {
        VStack {
            NavigationLink(destination: DetailView(showSelf: $showDetail), isActive: $showDetail) {
                Text("Push")
            }
        }
    }
}

struct DetailView: View {
    @Binding var showSelf: Bool

    var body: some View {
        Button(action: {
            self.showSelf = false
        }) {
            Text("Pop")
        }
    }
}
*/



// This one works on iPhones and iPads
struct RootView: View {
    var body: some View {
        NavigationStackView {
            View1()
        }
    }
}

struct View1: View {
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack {
                Text("VIEW 1")
                Spacer()

                PushView(destination: View2()) {
                    Text("PUSH TO VIEW 2")
                }
            }
        }
    }
}

struct View2: View {
    @EnvironmentObject var navStack: NavigationStack
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                Text("VIEW 2")
                Spacer()

                Button(action: {
                    self.navStack.pop()
                }, label: {
                    Text("PROGRAMMATICALLY POP TO VIEW 1")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
