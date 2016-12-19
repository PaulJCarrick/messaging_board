#!/usr/bin/env ruby
require 'post_helper'

COMMENT_BODY  = 'This is a test comment.'.freeze

def create_comment
  comment = Comment.find_by(body: COMMENT_BODY)

  comment.destroy unless comment.nil?

  post = create_and_check_post

  Comment.create(body: COMMENT_BODY, post_id: post.id, user_id: post.user.id)
end

def check_comment(comment, check_id = true)
  raise "Comment is nil" if comment.nil?
  raise "ID is nil" unless comment.id.present? || !check_id

  unless comment.body == COMMENT_BODY
    raise "Body: #{comment.body} does not match #{COMMENT_BODY}."
  end

  unless comment.post.title == TITLE
    raise "User: #{comment.post.title} does not match #{TITLE}."
  end

  unless comment.user.email == EMAIL
    raise "User: #{comment.user.email} does not match #{EMAIL}."
  end
end

def create_and_check_comment
  comment = create_comment

  check_comment(comment)

  comment
end

def find_comment(id)
  Comment.find(id)
end

