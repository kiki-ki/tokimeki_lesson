class TicTacToe
  attr_reader :players, :board, :current_player, :winner

  ROW_NUM = 3
  MARKS = ["o", "x"]

  def initialize(players)
    @players = players.shuffle
    @board = Array.new(ROW_NUM) { Array.new(ROW_NUM) }
    @current_player = 0
    @winner = nil
  end

  def play_move(position)
    x, y = position.divmod(ROW_NUM)
    return false unless valid_position?(x, y)

    place_mark(x, y)
    update_winner(x, y)
    switch_current_player
    true
  end

  def current_mark
    MARKS[@current_player]
  end

  def current_player_name
    players[current_player]
  end

  def game_over?
    winner || board_full?
  end

  def max_cell_width
    max_num_length = (ROW_NUM * ROW_NUM - 1).to_s.length
    [max_num_length, MARKS.map(&:length).max].max + 2
  end

  private

  def valid_position?(x, y)
    x.between?(0, ROW_NUM - 1) && y.between?(0, ROW_NUM - 1) && board[x][y].nil?
  end

  def place_mark(x, y)
    @board[x][y] = current_mark
  end

  def update_winner(x, y)
    @winner = current_player_name if winning_move?(x, y)
  end

  def switch_current_player
    @current_player = (current_player + 1) % 2
  end

  def board_full?
    board.all? { |row| row.all? }
  end

  def winning_move?(x, y)
    [
      board[x], # Row
      board.transpose[y], # Column
      board.each_index.map { |i| board[i][i] }, # Diagonal
      board.each_index.map { |i| board[i][ROW_NUM - 1 - i] } # Anti-Diagonal
    ].any? { |line| line.count(current_mark) == ROW_NUM }
  end
end
