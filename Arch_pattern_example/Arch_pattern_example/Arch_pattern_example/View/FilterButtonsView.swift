//
//  FilterButtonsView.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 25/11/2024.
//

import SwiftUI

enum AppAction {
    case buttonPress(value: Status)
}

typealias DispatchFunction = (Status) -> Void

struct FilterButtonsView: View {
    var dispatch : DispatchFunction = { action in
            print(action)
        }
    var body: some View {
        VStack(alignment: .center){
            HStack {
                SubView(dispatch: dispatch, statusClicked: .alive)
                    .background(Color.green)
                    .cornerRadius(20)

                Spacer()
                
                SubView(dispatch: dispatch, statusClicked: .dead)
                    .background(Color.gray)
                    .cornerRadius(20)

                        
                Spacer()
                
                SubView(dispatch: dispatch, statusClicked: .unknown)
                    .background(Color.black)
                    .cornerRadius(20)


            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct SubView : View {
    var dispatch : DispatchFunction
    var statusClicked : Status
    
    var body: some View {
        Button(action: { dispatch(statusClicked) }) {
            Text(statusClicked.rawValue)

        }
        .padding()
        .foregroundColor(.white)
    }
}

#Preview {
    FilterButtonsView()
}
