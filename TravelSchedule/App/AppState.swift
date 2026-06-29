import SwiftUI

final class AppState: ObservableObject {
    @Published var error: AppError? = nil
}
