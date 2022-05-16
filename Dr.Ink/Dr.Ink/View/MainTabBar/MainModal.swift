//
//  ChallengeModal.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct MainModal: View {
    @Binding var isShowing: Bool
    @Binding var content: ModalContent?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack {
                    switch content {
                    case .challengeLowCaffeine:
                        ChallengeContent(detail: .rowCaffeine)
                    case .challengeSugarFree:
                        ChallengeContent(detail: .sugarFree)
                    case .alarmSetting:
                        AlarmSettingView()
                    case .genderSetting:
                        GenderSettingView()
                    case .weightSetting:
                        WeatherSettingView()
                    case .activitySetting:
                        ActivitySettingView()
                    case .weatherSetting:
                        WeatherSettingView()
                    default:
                        Text("Error")
                    }
                }
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeOut, value: isShowing)
    }
}

struct ChallengeModal_Previews: PreviewProvider {
    static var previews: some View {
        MainModal(isShowing: .constant(true), content: .constant(nil))
    }
}
