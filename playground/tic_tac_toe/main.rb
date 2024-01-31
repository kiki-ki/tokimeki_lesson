require_relative 'tic_tac_toe'

def get_player_name(player_number)
  print "Player#{player_number}の名前を入力してください: "
  gets.chomp
end

def get_player_names
  [get_player_name(1), get_player_name(2)]
end

def display_board(game)
  max_cell_width = game.max_cell_width
  game.board.each_with_index do |row, i|
    puts format_row(row, i, max_cell_width)
    puts "-" * row_string_length(row, max_cell_width)
  end
end

def format_row(row, row_index, max_cell_width)
  row.map.with_index { |cell, col_index|
    display = cell.nil? ? (row_index * TicTacToe::ROW_NUM + col_index).to_s : cell
    display.center(max_cell_width)
  }.join("|")
end

def row_string_length(row, max_cell_width)
  row.length * max_cell_width + (row.length - 1)
end

def request_player_move(game)
  print "(#{game.current_mark}): #{game.players[game.current_player]}さんの手番です。マークする位置を選んでください（0〜#{TicTacToe::ROW_NUM**2 - 1}の数字）: "
  gets.chomp.to_i
end

players = get_player_names
game = TicTacToe.new(players)

until game.game_over?
  puts "\n現在の盤面:"
  display_board(game)
  position = request_player_move(game)
  unless game.play_move(position)
    puts "不正な値です。再入力してください"
    redo
  end
end

puts "\n最終盤面:"
display_board(game)
puts game.result_message
