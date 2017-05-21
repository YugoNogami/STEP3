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
