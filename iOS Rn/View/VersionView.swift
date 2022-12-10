import SwiftUI

struct VersionView: View {
    var name: String
    var filename: String
    @State var presentReleaseNote = false
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
        }
        .onTapGesture {
            presentReleaseNote.toggle()
        }
        .padding()
        .sheet(isPresented: $presentReleaseNote) {
            ReleaseNoteView(filename: filename)
        }
    }
}

struct VersionView_Previews: PreviewProvider {
    static var previews: some View {
        VersionView(name: "iOS 16.2", filename: "iOS162.json")
    }
}
