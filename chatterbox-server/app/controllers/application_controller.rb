class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end
  
end
