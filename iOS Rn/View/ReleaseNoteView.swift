import SwiftUI

struct ReleaseNoteView: View {
    var filename: String
    @ObservedObject var releaseNotesViewModel: ReleaseNotesViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(filename: String) {
        self.filename = filename
        releaseNotesViewModel = ReleaseNotesViewModel(releaseNoteFilename: filename)
        releaseNotesViewModel.getData()
    }
    
    var body: some View {
#if os(macOS)
        HStack {
            Spacer()
            VStack {
                closeButton()
                    .padding()
                setupText()
            }
            Spacer()
        }
        
#endif
#if os(iOS)
        VStack {
            setupText()
        }
#endif
    }
}

#if os(macOS)
private extension ReleaseNoteView {
    @ViewBuilder private func closeButton() -> some View {
        HStack {
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "x.circle.fill")
                    .frame(width: 40, height: 40)
            }
        }
    }
}
#endif
private extension ReleaseNoteView {
    @ViewBuilder private func setupText() -> some View {
        ScrollView {
            Text(releaseNotesViewModel.note.description)
                .padding()
        }
    }
}

struct ReleaseNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ReleaseNoteView(filename: "iOS162.json")
    }
}
