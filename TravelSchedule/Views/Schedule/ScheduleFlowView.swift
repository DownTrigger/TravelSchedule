import SwiftUI

struct ScheduleFlowView: View {
    let from: String
    let to: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScheduleView(from: from, to: to, onDismiss: { dismiss() })
        }
        .errorOverlay()
    }
}
