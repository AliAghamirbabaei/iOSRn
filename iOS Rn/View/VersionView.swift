import SwiftUI

struct VersionView: View {
    var name: String
    var filename: String
    @State var presentReleaseNote = false
    
    var body: some View {
#if os(macOS)
        HStack {
            Text(name)
                .padding()
            Spacer()
        }
        .onTapGesture {
            presentReleaseNote.toggle()
        }
        .sheet(isPresented: $presentReleaseNote) {
            ReleaseNoteView(filename: filename)
        }
        
#endif
        
#if os(iOS)
        NavigationLink(destination: ReleaseNoteView(filename: filename), label: {
            HStack {
                Text(name)
                    .padding()
                Spacer()
            }
        })
#endif
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView(name: "iOS 16.2", filename: "iOS162.json")
    }
}
