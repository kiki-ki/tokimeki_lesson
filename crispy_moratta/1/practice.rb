
# 画面の大きさから時計の半径を決める
radius = [width, height].min / 2 * 0.95

fill "#F2F0D5"
stroke "#F2F0D5"

draw do
  background 0

  # 画面の中心を描画の基準にする
  translate width / 2, height / 2

  # 分単位の線を描画する
  push do
    strokeWeight 3
    60.times do
      rotate TWO_PI / 60.0
      line 0, -(radius - 10), 0, -radius
    end
  end

  # 5分単位の線を描画する
  push do
    strokeWeight 5
    12.times do
      rotate TWO_PI / 12.0
      line 0, -(radius - 20), 0, -radius
    end
  end

  # 数字を描画する
  push do
    textSize 24
    textAlign CENTER, TOP
    (1..12).each do |num|
      rotate TWO_PI / 12.0
      text num, 0, -(radius - 30), 1, 1
    end
  end

  # 現在時刻を取得する
  t = Time.now

  # 秒針を描画する
  push do
    strokeWeight 1
    rotate t.to_f % 60.0 / 60 * TWO_PI
    line 0, 0, 0, -(radius - 10)
  end

  # 分針を描画する
  push do
    strokeWeight 5
    rotate (t.min + t.sec / 60.0) / 60 * TWO_PI
    line 0, 0, 0, -(radius - 20)
  end

  # 時針を描画する
  push do
    strokeWeight 10
    rotate (t.hour + t.min / 60.0) / 12 * TWO_PI
    line 0, 0, 0, -(radius / 2)
  end
end