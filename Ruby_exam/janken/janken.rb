puts "最初はグー、じゃんけん・・・・"
#require 'byebug'; byebug
class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください"
    puts "0:グー, 1:チョキ, 2:パー"
    player_hand = gets
    return player_hand
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(0..2)
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    #byebug
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    jankens = ["グー", "チョキ", "パー"]
    if player_hand != "0\n" && player_hand != "1\n" && player_hand != "2\n"
      puts "0~2の数字を入力してください"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
    else
      while true
        player_hand = player_hand.to_i
        puts "あなたの手は#{jankens[player_hand]},相手の手は#{jankens[enemy_hand]}"
        judge = ((player_hand - enemy_hand) + 3) % 3
        if judge == 0
          puts "あいこ"
          player = Player.new
          enemy = Enemy.new
          janken = Janken.new
          janken.pon(player.hand, enemy.hand)
          return true
        elsif judge == 2
          puts "あなたの勝ちです"
          return false
        elsif judge == 1
          puts "あなたの負けです"
          return false
        end
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
