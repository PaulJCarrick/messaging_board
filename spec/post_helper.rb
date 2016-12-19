#!/usr/bin/env ruby
require 'user_helper'
TITLE = 'Test POST'.freeze
BODY  = 'This is a test post.'.freeze

def create_post
  post = Post.find_by(title: TITLE)

  post.destroy unless post.nil?

  user = create_and_check_user

  Post.create(title: TITLE, body: BODY, user_id: user.id)
end

def check_post(post, check_id = true)
  raise "Post is nil" if post.nil?
  raise "ID is nil" unless post.id.present? || !check_id

  unless post.title == TITLE
    raise "Ttile: #{post.title} does not match #{TITLE}."
  end

  unless post.body == BODY
    raise "Body: #{post.body} does not match #{BODY}."
  end

  unless post.user.email == EMAIL
    raise "User: #{post.user.email} does not match #{EMAIL}."
  end
end

def create_and_check_post
  post = create_post

  check_post(post)

  post
end

def find_post(id)
  Post.find(id)
end

