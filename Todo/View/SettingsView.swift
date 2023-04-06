//
//  SettingsView.swift
//  Todo
//
//  Created by Rafał Gęsior on 05/04/2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Form {
                    //MARK: - SECTION #3
                    Section(header: Text("Follow me on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://www.rgkonsulting.pl")
                    }
                    
                    //MARK: - SECTION #4
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compability", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Rafal Gesior")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    }
                    .padding(.vertical, 3)
                 
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                //MARK: - FOOTER
                Text("Copyright © RGKonsulting")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
            } //: VSTACK
            .navigationBarItems(trailing:
                                    Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
            Image(systemName: "xmark")
            }
            )
            .navigationBarTitle("Settings", displayMode: .inline)
         
            
        } //: NAVIGATION
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
