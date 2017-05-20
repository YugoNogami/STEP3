require 'rubygems'
require 'sinatra'
require 'json'

#ユーザ仮データ 
users = {
 "0001" => {:name => "user1", :food => "お米"},
 "0002" => {:name => "user2", :food => "みかん"},
 "0003" => {:name => "user3", :food => "昆布"},
 "0004" => {:name => "user4", :food => "ゆで玉子"},
 "0005" => {:name => "user5", :food => "納豆"},
}

get '/' do
 users["0001"][:name] 
end

get '/:id' do

 if users.has_key?(params[:id]) then
  users[params[:id]][:name]
 else 
  "ID:#{params[:id]}は存在しません"
 end

end

