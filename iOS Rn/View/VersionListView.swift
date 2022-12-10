import SwiftUI

struct VersionListView: View {
    @ObservedObject var versionsViewModel = VersionsViewModel()
    @State var isViewPresented: Bool = false
    
    init() {
        versionsViewModel.getData()
    }
    
    var body: some View {
        #if os(macOS)
        macOSList()
        #endif
        #if os(iOS)
        NavigationView {
            iOSList()
                .navigationTitle("Versions")
        }
        #endif
    }
}

private extension VersionListView {
    @ViewBuilder private func iOSList() -> some View {
        VStack {
            List {
                ForEach(versionsViewModel.versions, id: \.self) { version in
                    VersionView(name: version.versionName, filename: version.url)
                }
            }
        }
    }
}

private extension VersionListView {
    @ViewBuilder private func macOSList() -> some View {
        VStack {
            List {
                ForEach(versionsViewModel.versions, id: \.self) { version in
                    VersionView(name: version.versionName, filename: version.url)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VersionListView()
    }
}
