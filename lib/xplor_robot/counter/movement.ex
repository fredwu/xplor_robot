defmodule XplorRobot.Counter.Movement do
  @doc """
  iex> Movement.count({0, 0}, {1, 2})
  3

  iex> Movement.count({0, 0}, {3, 2})
  5

  iex> Movement.count({1, 1}, {3, 3})
  4

  iex> Movement.count({2, 2}, {1, 1})
  2

  iex> Movement.count({1, 3}, {2, 2})
  2
  """
  def count({x_from, y_from}, {x_to, y_to}) do
    abs(x_to - x_from) + abs(y_to - y_from)
  end
end
