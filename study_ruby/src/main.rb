require 'active_record'
require 'mysql2'
require "rubygems"
require 'yaml'
require 'hashie'
require './models/user.rb'
require 'sinatra'

#create
post '/create' do
begin
data = JSON.parse(request.body.read)
name= data["name"]
food= data["food"]
user=User.new(:name =>name,:food=>food)
if user.valid?  then
 user.save
 "DB登録しました" + "name:" + name.to_s+ "\n"
else 
 user.errors.full_messages
end
rescue
 "DB更新エラーです"
end
end


#read DB内のデータ確認
get '/read/:serch_id' do
content_type :json
begin
user=User.find_by(id: params[:serch_id])
user.to_json
rescue
 "DB更新エラーです"
end
end

#update
put '/update/:id' do
data = JSON.parse(request.body.read)
name= data["name"]
food= data["food"]
begin
user=User.where(id: params[:id]).update_all(name:name,food:food)
rescue 
 "DB更新エラーです"
end
end

#delete
delete '/delete/:id' do
begin
user=User.find_by(id: params[:id])
user.destroy
"削除しました"
rescue 
 "DB更新エラーです"
end
end
