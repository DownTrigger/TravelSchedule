import SwiftUI

enum AppError {
    case server
    case noInternet

    var imageName: String {
        switch self {
        case .server: return "serverError"
        case .noInternet: return "noInternet"
        }
    }

    var title: String {
        switch self {
        case .server: return "Ошибка сервера"
        case .noInternet: return "Нет интернета"
        }
    }
}

struct ErrorView: View {
    let error: AppError

    var body: some View {
        VStack(spacing: 16) {
            Image(error.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)

            Text(error.title)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color("textPrimary"))
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        ErrorView(error: .server)
        ErrorView(error: .noInternet)
    }
}
