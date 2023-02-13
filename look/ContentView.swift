//
//  ContentView.swift
//  look
//
//  Created by 中原麻央 on 2023/02/12.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnLocked = false
    var body: some View {
        VStack {
            if isUnLocked {
                Text("認証されました")
            } else {
                Text("ロック中")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        context.localizedCancelTitle = "パスワード入力"
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,error:
                                        &error) {
            let reason = "一致しません"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                      localizedReason: reason) { success, authenticationError in
                if success {
                    isUnLocked = true
                } else {
                    
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


