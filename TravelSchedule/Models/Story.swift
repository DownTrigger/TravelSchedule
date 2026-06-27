import SwiftUI

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
}
