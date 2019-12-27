defmodule Game do
  @players {:x, :o}

  def check_player(player) do
    case player do
      :x -> {:ok, player}
      :o -> {:ok, player}
      _ -> {:error, :invalid_player}
    end
  end

  def place_piece(board, place, player) do
    case board[place] do
      nil -> {:error, :invalid_location}
      :x -> {:error, :occupied}
      :o -> {:error, :occupied}
      _ -> {:ok, %{board | place => player}}
    end
  end

  def play_at(board, row, col, player) do
    with {:ok, valid_player} <- check_player(player),
         {:ok, square}       <- Square.new(col, row),
         {:ok, new_board}    <- place_piece(board, square, valid_player),
    do: new_board
  end

  def new_board do
    for s <- squares(), into: %{}, do: {s, :empty}
  end

  def squares do
    for c <- 1..3, r <- 1..3, into: MapSet.new(), do: %Square{col: c, row: r}
  end

  def make_cards do
    for suit <- ["Spades","Hearts","Clubs","Diamonds"], num <- List.flatten(["Ace",Enum.to_list(2..10),"Jack","Queen","King"]) do
      # IO.inspect(num)
      # IO.inspect suit
      IO.puts("#{num} of #{suit}")
    end
  end

  def make_cards2 do
    suits = ~w(Spades Hearts Clubs Diamonds)
    ranks = rtos(2..10) ++ ~w(Jack King Queen Ace)
    for r <- ranks, s <- suits, do: r <> " of " <> s
  end

  def rtos(range), do: Enum.map(range, &Integer.to_string/1)

  def triangles(n) when n < 1, do: []

  def triangles(n) do
    for a <- 1..n, b <- 1..n, c <- 1..n,
      c >= b, b >= a, a + b > 3,
      a * a + b * b == c * c,
      do: {a, b, c}
  end
end
