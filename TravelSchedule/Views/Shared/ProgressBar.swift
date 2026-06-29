import SwiftUI

struct ProgressBar: View {
    let filled: Bool
    let progress: CGFloat

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white.opacity(0.4))
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white)
                    .frame(width: filled ? geo.size.width : geo.size.width * progress)
            }
        }
        .frame(height: 4)
    }
}
