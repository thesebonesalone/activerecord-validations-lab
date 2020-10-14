class PostValidator < ActiveModel::Validator
    def validate(post)
        if !post.title
            post.errors[:post] << "Must have a title"
        elsif post.content.length < 250
            post.errors[:post] << "Content is too short!"
        elsif post.summary.length > 250
            post.errors[:post] << "Summary is too long"
        elsif ["Won't Believe","Secret","Top ", "Guess"].select{|phrase| post.title.include?(phrase)}.length == 0
            post.errors[:post] << "Title ain't clickbait"
        elsif !["fiction","non_fiction"].include?(post.category.downcase)
            post.errors[:post] << "Must be fiction or non_fiction"
        end
    end
end