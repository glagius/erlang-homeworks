defmodule ElixirHomeworkTest do
  use ExUnit.Case
  doctest ElixirHomework

  test "greets the world" do
    assert ElixirHomework.hello() == :world
  end
end
