class FavoriteMailer < ActionMailer::Base
    default from: "jason.carter.martin@gmail.com"

    def new_comment(user, post, comment)
        @user = user
        @post = post
        @comment = comment

        # Headers

        headers["Message-ID"] = "<comments/#{@comment.id}@jasonmartin-bloccit"
        headers["In-Reply-To"] = "<post/#{@post.id}@jasonmartin-bloccit"
        headers["References"] = "<post/#{@post.id}@jasonmartin-bloccit"

        mail(to: user.email, subject: "New comment on #{post.title}")   
    end
    
end
