require 'active_record'
require 'mysql2'
require "rubygems"
require 'yaml'
require 'hashie'

# DB設定ファイルの読み込み
config = YAML.load_file('./models/database.yml')
ActiveRecord::Base.establish_connection(config["db"])

# モデルのクラスを宣言
class User < ActiveRecord::Base
end

begin
  for num in 1..100 do
    #read DB内のデータ確認
    p "#{num}回目:"
    #con.execute("SELECT SLEEP(#{num}) as aaa")
    User.connection.execute("SELECT SLEEP(100) as aaa")
  end
rescue => e
  p e.class
  p e.message
  p e.backtrace
end

