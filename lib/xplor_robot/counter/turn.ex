defmodule XplorRobot.Counter.Turn do
  alias XplorRobot.Counter.Movement

  @doc """
  iex> Turn.count({0, 0, nil}, {1, 2, :sleep_check})
  4

  iex> Turn.count({0, 0, :nappy_change}, {1, 2, :sleep_check})
  5

  iex> Turn.count({0, 0, :sleep_check}, {3, 2, :sleep_check})
  6

  iex> Turn.count({2, 2, :nappy_change}, {1, 1, :sleep_check})
  4
  """
  def count({x_from, y_from, nil}, {x_to, y_to, _task}) do
    Movement.count({x_from, y_from}, {x_to, y_to}) + 1
  end

  def count({x_from, y_from, task}, {x_to, y_to, task}) do
    Movement.count({x_from, y_from}, {x_to, y_to}) + 1
  end

  def count({x_from, y_from, _task_a}, {x_to, y_to, _task_b}) do
    Movement.count({x_from, y_from}, {x_to, y_to}) + 2
  end
end
