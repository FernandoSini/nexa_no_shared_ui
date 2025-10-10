import SwiftUI
import Shared
struct ContentView: View {

    init(){
        Koin_configKt.doInitKoin()
    }
    var body: some View {
        SplashView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()

    }
}


