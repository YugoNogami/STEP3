require 'mysql2'
  
#mysqlに接続
#host、username、password、データベース名を指定
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "root123", :database => "nogami")

#レコードの追加（プレースホルダ）
name = "ろくろう"
food = "にゅうめん"
client.query("insert into users(name, food) values ('#{name}', '#{food}')")

# レコードを取得して表示
client.query("SELECT * FROM users").each do |e1|
 puts e1
end

#レコードの削除
client.query("delete from users where name = '#{name}'")

