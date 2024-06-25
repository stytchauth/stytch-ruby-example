require 'stytch'
require 'dotenv'
require 'sinatra'

Dotenv.load

set :content_type => 'application/json', :port => 3000
enable :sessions

get '/' do
  if session[:token]
    resp = client.sessions.authenticate(session_token: session[:token])
    return erb :login_or_signup unless resp['status_code'] == 200
    session[:token] = resp['session_token']
    session[:email] = resp['user']['emails'][0]['email']
    erb :logged_in
  else
    erb :login_or_signup
  end
end

post '/login-or-create-user' do
  resp = client.magic_links.email.login_or_create(
    email: params[:email],
    login_magic_link_url: magic_link_url,
    signup_magic_link_url: magic_link_url,
  ).symbolize_keys

  if resp[:status_code] != 200
    return resp[:error_message]
  end

  erb :email_sent
end

get '/authenticate' do
  resp = client.magic_links.authenticate(
    token: params[:token],
    session_duration_minutes: 60
  ).symbolize_keys

  if resp[:status_code] != 200
    return resp[:error_message]
  end

  session[:token] = resp[:session_token]
  session[:email] = resp[:user]['emails'][0]['email']
  erb :logged_in
end

get '/logout' do
  session.clear
  erb :logged_out
end

def client
  Stytch::Client.new(
    project_id: ENV['STYTCH_PROJECT_ID'],
    secret: ENV['STYTCH_SECRET'],
    env: ENV['STYTCH_ENV'].to_sym
  )
end

def magic_link_url
  "#{ENV['HOST']}/authenticate"
end
