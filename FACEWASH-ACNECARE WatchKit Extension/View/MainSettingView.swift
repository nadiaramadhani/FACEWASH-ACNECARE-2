

import SwiftUI

struct MainSettingView : View {
    @State var changeTime = false
    @State var voiceOver = false
    @StateObject var notifManager = LocalNotificationManager()
    @State var selected = Date()
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        
        VStack{
            ZStack{
                NavigationLink("", destination: SetReminderView()
                    .environmentObject(notifManager)
                               , isActive: $changeTime)
                    .opacity(0)
            Button(action: {
                changeTime.toggle()
                
            }, label: {
                HStack{
                    Text("Set reminder")
                    Spacer()
                    
                }
            })
                
            }
            
            Button(action: {
                if voiceOver{
                }else {
                    AVService.shared.player?.stop()
                }
                
            }, label: {
                HStack{
                    Toggle("Voice over", isOn: $voiceOver)
                }
            })
            Spacer()

            
        }.navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
    }
}



struct MainSettingView_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingView()
    }
}
