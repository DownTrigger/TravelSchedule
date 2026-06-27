import SwiftUI

struct StoriesView: View {
    @Environment(\.dismiss) private var dismiss

    private let stories: [Story] = MockScheduleService().getStories()

    @State private var currentIndex = 0
    @State private var progress: CGFloat = 0
    @State private var timer: Timer? = nil

    private let duration: TimeInterval = 10

    var body: some View {
        ZStack(alignment: .top) {
            stories[currentIndex].color.ignoresSafeArea()

            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text(stories[currentIndex].title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                    Text(stories[currentIndex].description)
                        .font(.system(size: FontSize.body))
                        .foregroundStyle(.white.opacity(0.9))
                }
                .padding(16)
                .padding(.bottom, 40)
            }

            HStack {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToPrevious() }
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { goToNext() }
            }

            VStack(spacing: 16) {
                HStack(spacing: 4) {
                    ForEach(stories.indices, id: \.self) { index in
                        ProgressBar(filled: index < currentIndex, progress: index == currentIndex ? progress : 0)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)

                HStack {
                    Spacer()
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                }
            }
        }
        .gesture(DragGesture(minimumDistance: 30).onEnded { value in
            if value.translation.height > 60 { dismiss() }
        })
        .onAppear { startTimer() }
        .onDisappear { stopTimer() }
    }

    private func startTimer() {
        stopTimer()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            progress += 0.05 / duration
            if progress >= 1 { goToNext() }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func goToNext() {
        if currentIndex < stories.count - 1 {
            currentIndex += 1
            startTimer()
        } else {
            dismiss()
        }
    }

    private func goToPrevious() {
        if currentIndex > 0 {
            currentIndex -= 1
            startTimer()
        }
    }
}
