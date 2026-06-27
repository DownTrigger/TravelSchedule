import SwiftUI

struct BackButton: ViewModifier {
    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: Icons.chevronLeft)
                            .foregroundStyle(Color("textPrimary"))
                    }
                }
            }
    }
}

extension View {
    func customBackButton() -> some View {
        modifier(BackButton())
    }
}
