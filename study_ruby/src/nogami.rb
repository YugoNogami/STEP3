#require 'rubygems'
#require 'sinatra'
#require 'json'

#ユーザ仮データ 
class Nogami
 def initialize(a,b)
    @name = a
    @food = b
    @user_info=[:name => @name,:food => @food]
 end

 def p_nogami(x)
  p x
  p "nogami"
 end

 def getName()
  @name
 end

 def get_user_info()
  @user_info
 end

end


users = {
 "0001" => {:name => "user1", :food => "お米"},
 "0002" => {:name => "user2", :food => "みかん"},
 "0003" => {:name => "user3", :food => "昆布"},
 "0004" => {:name => "user4", :food => "ゆで玉子"},
 "0005" => {:name => "user5", :food => "納豆"},
}

users.each do |d|
 p d[1][:food]
end
