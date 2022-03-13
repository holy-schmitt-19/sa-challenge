//
//  ContentView.swift
//  Iterable-SA-Challenge
//
//  Created by Michael Schmitt on 3/12/22.
//

import SwiftUI
import IterableSDK

struct ContentView: View {
    func myUserUpdateSuccessHandler(data:[AnyHashable:Any]?) -> () {
        // success
        print("sent to Iterable success")
    }

    func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
        // failure
        print("sent to Iterable failure")
    }
    
    var body: some View {
        
        Image("holy-schmitt").resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(Circle())
        
        Text("Hello, Iterable!")
            .padding()
        
        Button(action: {
                let dataField : [String: Any] = [
                    "firstName": "Mike",
                    "isRegisteredUser": true,
                    "SA_User_Test_Key": "completed"
                ]

                // Most important code
                IterableAPI.updateUser(dataField, mergeNestedObjects: false, onSuccess: myUserUpdateSuccessHandler, onFailure: myUserUpdateFailureHandler)
        }) {
            // How the button looks like
            Text("Initial Profile Update")
                .padding()
        }
        
        Button(action: {
            IterableAPI.track(
                event: "mobileSATestEvent",
                dataFields: [
                    "platform": "iOS",
                    "isTestEvent": true,
                    "url": "https://iterable.com/sa-test/Mike",
                    "secret_code_key": "Code_123"
                ]
            )
        }) {
            // How the button looks like
            Text("Send Custom Event");
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
