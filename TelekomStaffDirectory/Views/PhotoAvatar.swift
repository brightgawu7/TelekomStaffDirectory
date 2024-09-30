import SwiftUI

/// A view that displays a user's avatar, either from an image URL or a placeholder icon.
struct PhotoAvatar: View {
    /// The URL of the image to display.
    var imageURL: URL?

    /// The size of the avatar image.
    var size: CGFloat = 40

    var body: some View {
        // Use AsyncImage to load the image from the URL asynchronously
        AsyncImage(url: imageURL) { image in
            // Successfully loaded image
            image
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        } placeholder: {
            // Placeholder icon when image is nil or loading
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .foregroundColor(.gray)
        }
        .frame(width: size, height: size)
        .clipped()
    }
}

#Preview {
    VStack {
        // Preview with a valid image URL
        PhotoAvatar(imageURL: URL(string:
            """
            https://images.pexels.com/photos/28186055/pexels-photo-28186055/free-photo-of-a-man-and-woman-sitting-on-a-couch-together.jpeg
            """
        ))

        // Preview with a nil image URL (showing placeholder)
        PhotoAvatar(imageURL: nil, size: 200)
    }
}
