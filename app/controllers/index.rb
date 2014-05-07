get '/' do
  erb :index
end

get '/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
  erb :index
end

get '/sign_out' do
  session.clear
  erb :index
end

get '/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session[:access_token] = @access_token
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token

  puts "\n\n\n\n\n"


  @user = User.create(username: @access_token.params[:screen_name] ,oauth_token: @access_token.token,oauth_secret: @access_token.secret)
  session[:id] = @user.id
  erb :index

end

post '/' do

  @user = User.find(session[:id])
  @user.client.update(params[:tweet])
end
