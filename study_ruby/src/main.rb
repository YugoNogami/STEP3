require 'active_record'
require 'mysql2'
require "rubygems"
require 'yaml'
require 'hashie'
require './models/user.rb'
require 'sinatra'

#create
get '/create/:name' do
food="マクドナルド"
user=User.create(name:params[:name],food:food)
user.save
end


#read DB内のデータ確認
get '/read/:serch_id' do
user=User.find_by(id: params[:serch_id])
#user=User.find_by(name: "いちろう") 
"id:" + user[:id].to_s + ", name:" + user[:name] + ", food:" + user[:food] + "\n"
#params[:serch_id].class.to_s
end

#update
get '/update/:name' do
food="まつや"
User.where(name: params[:name]).update_all(food:food)
end

#delete
get '/delete/:name' do
user=User.find_by(name: params[:name])
user.destroy
end
