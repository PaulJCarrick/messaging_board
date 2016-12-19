#!/usr/bin/env ruby
FIRST_NAME = 'John'.freeze
LAST_NAME  = 'Doe'.freeze
EMAIL      = 'jdoe@gmail.com'
PASSWORD   = 'ignore.me'

def create_user
  user = User.find_by(email: EMAIL)

  user.destroy unless user.nil?

  password = User.new(:password => PASSWORD).encrypted_password

  User.create(first_name: FIRST_NAME, last_name: LAST_NAME,
              email: EMAIL, password: password)
end

def check_user(user, check_id = true)
  raise "User is nil" if user.nil?
  raise "ID is nil" unless user.id.present? || !check_id

  unless user.first_name == FIRST_NAME
    raise "First Name: #{user.first_name} does not match #{FIRST_NAME}."
  end

  unless user.last_name == LAST_NAME
    raise "Last Name: #{user.last_name} does not match #{LAST_NAME}."
  end

  unless user.email == EMAIL
    raise "First Name: #{user.email} does not match #{EMAIL}."
  end
end

def create_and_check_user
  user = create_user

  check_user(user)

  user
end

def find_user(id)
  User.find(id)
end

