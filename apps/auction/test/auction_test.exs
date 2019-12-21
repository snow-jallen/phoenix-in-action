defmodule AuctionTest do
  use ExUnit.Case
  doctest Auction

  test "greets the world" do
    assert Auction.hello() == :world
  end

  test "add 1 plus 2" do
    assert Auction.add(1, 2) == 3
  end
end
