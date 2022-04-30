# AceBook

A Facebook clone created using Ruby on Rails!

## Features

- User Authentication
- Users can make posts, both with images and text 
- Users can make comments on posts 
- Users can like a post
- Users can modify their profile information and upload an avatar
- Avatar displayed on posts and navbar
- Default avatar given to user on account creation
- User can send friend requests to other users
- Users can accept/reject friend requests
- Friends are displayed on home page


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again


