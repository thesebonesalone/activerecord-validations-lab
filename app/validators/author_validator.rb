class AuthorValidator < ActiveModel::Validator
    def validate(author)
        unless author.name
            author.errors[:author] << "Must have a name"
        end
        unless !Author.all.map{|a| a.name}.include?(author.name)
            author.errors[:author] << "Name must be unique"
        end
        unless author.phone_number.length >= 10
            author.errors[:author] << "Please Enter a valid phone number"
        end
    end
end