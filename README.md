# messaging_board
## Barebones Messaging Board
### Project Specs
1. Users can register and then must be authenticated before logging in (we use Devise). Users should have an email (used for logging in), and a first and last name at a minimum. You can add things like a description or "about me" if you'd like.
2. Users can create posts (title, body, author (user_id), etc)
3. Users can comment on other users' posts (Comments have post_id, body, author (user_id))
4. There is a posts index page that lists all posts (for entire site). This is the 'homepage'. This should display a list of posts with the title and the author's name
5. Order posts with most recent posts at the top of the page
6. There is a post show page, that shows a single post. Underneath the post are all the comments, ordered by date created (oldest at the top)
7. When commenting on a post, you have freedom as far as the layout goes, you can just have a little box that opens, and the user types in their comment. You can also use a modal, etc, whatever you want. It makes more sense to have the form for adding a comment be close to where the comment will end up.

### Project Requirements
* Upload finished project to github
* Use latest version of Rails 4
* Use ruby 2.2 or newer (we use 2.3 on our main project)
* Rspec unit tests minimum of 10
* One feature test (rspec/capybara)
* If not specified, use whatever gem(s) get the job done

### Bonus features (not required, but nice to have)
* Style using Bootstrap 3
* Add a modal for creating a new post
* Add a modal for logging in
* Paginate posts#index and/or posts#show (comments)
* Upload to heroku (make an account for free)
