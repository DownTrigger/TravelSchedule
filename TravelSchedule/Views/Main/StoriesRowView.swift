import SwiftUI

struct StoriesRowView: View {
    let onTap: () -> Void

    private let stories = ["story1", "story2", "story3", "story4"]
    @State private var viewedStories: Set<String> = []

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(stories, id: \.self) { story in
                    StoryThumbnailView(
                        title: story,
                        isViewed: viewedStories.contains(story)
                    )
                    .onTapGesture {
                        viewedStories.insert(story)
                        onTap()
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
    }
}

struct StoryThumbnailView: View {
    let title: String
    let isViewed: Bool

    var body: some View {
        Image("storyPlaceholder")
            .resizable()
            .scaledToFill()
            .frame(width: 92, height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .opacity(isViewed ? 0.5 : 1.0)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(Color("tsBlue"), lineWidth: 4)
                    .opacity(isViewed ? 0 : 1)
            )
    }
}
