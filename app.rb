require 'sinatra'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :add
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    Bookmark.delete(params['submit'])
    redirect '/bookmarks'
  end

  post '/bookmarks/comment' do
    Bookmark.comment(params['comment_text'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
