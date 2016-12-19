#!/usr/bin/env ruby
# spec/features/register_spec.rb
require 'spec_helper'

def register_with(first_name, last_name, email, password, confirm_password)
  visit new_user_registration_path

  fill_in 'user_first_name',            with: first_name
  fill_in 'user_last_name',             with: last_name
  fill_in 'user_email',                 with: email
  fill_in 'user_password',              with: password
  fill_in 'user_password_confirmation', with: confirm_password

  click_button 'Sign up'
end

def sign_in
  user = create(:user)

  visit  new_user_session_path

  fill_in 'Email',    with: user.email
  fill_in 'Password', with: user.password

  click_button 'Sign in'
end

feature 'User Registers' do
  scenario 'with valid email and password' do
    register_with 'John', 'Doe', "jdoe-#{DateTime.now.strftime('%d-%m-%Y_%H-%M-%S')}@gmail.com", 'password', 'password'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'with invalid email' do
    register_with 'John', 'Doe', 'invalid_email.gmail.com', 'password', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    register_with 'John', 'Doe', 'jdoe@gmail.com', '', ''

    expect(page).to have_content('Sign up')
  end

  scenario 'with invalid password' do
    register_with 'John', 'Doe', "jdoe-#{DateTime.now.strftime('%d-%m-%Y_%H-%M-%S')}@gmail.com", 'password', 'bad_password'

    expect(page).to have_content('Sign up')
  end
end