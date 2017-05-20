require 'active_record'
require 'mysql2'
require "rubygems"
require 'yaml'
require 'hashie'

# DB設定ファイルの読み込み
config = YAML.load_file('./models/database.yml')
ActiveRecord::Base.establish_connection(config["db"])

name = "はちろう"
food = "つけめん"

# モデルのクラスを宣言
class User < ActiveRecord::Base
end

#create レコード追加
#user=User.create(name:name,food:food)
#user.save

#read DB内のデータ確認
p "全レコード"
User.all.each do |v|
 p v
end
p "最初のレコード"
p User.first
p "最後のレコード"
p User.last
p "特定のレコード"
User.where(name: 'ななろう').order('created_at DESC').each do |v|
 p v
end

#update DB内のデータ更新
#User.where(name: "ゆうご").update_all(name: "はちろう")
user = User.find_by(name: 'はちろう')
user.update(food: 'さかな')

#delete
user = User.find_by(food: 'にく')
user.destroy

#
