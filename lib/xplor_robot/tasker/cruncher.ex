defmodule XplorRobot.Tasker.Cruncher do
  alias XplorRobot.Router.TurnCounter

  @origin {0, 0, nil}

  @doc """
  iex> [
  iex>   {1, 1, :nappy_change},
  iex>   {1, 1, :sleep_check},
  iex>   {2, 2, :nappy_change},
  iex> ]
  iex> |> Cruncher.crunch()
  iex> |> Cruncher.final_numbers()
  [9, 10, 8, 10, 10, 11]

  iex> Cruncher.crunch(1, {1, 1, :nappy_change}, [
  iex>   {1, 1, :sleep_check},
  iex>   {2, 2, :nappy_change},
  iex> ])
  [
    {:final, 7, [
      {3, [{1, 1, :sleep_check}, {2, 2, :nappy_change}]},
      {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
    ]},
    {:final, 8, [
      {4, [{2, 2, :nappy_change}, {1, 1, :sleep_check}]},
      {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
    ]}
  ]
  """
  def crunch(tasks) do
    crunch(0, @origin, tasks, [])
  end

  def crunch(prev_count, current, remaining, stack \\ [])

  def crunch(prev_count, _current, [], stack) do
    {:final, prev_count, stack}
  end

  def crunch(prev_count, current, remaining, stack) do
    stack = [{prev_count, [current | remaining]} | stack]

    remaining
    |> Enum.map(fn task ->
      crunch(
        TurnCounter.count(current, task) + prev_count,
        task,
        remaining -- [task],
        stack
      )
    end)
    |> List.flatten()
  end

  @doc """
  iex> Cruncher.final_numbers([
  iex>   {:final, 7, [
  iex>     {3, [{1, 1, :sleep_check}, {2, 2, :nappy_change}]},
  iex>     {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
  iex>   ]},
  iex>   {:final, 8, [
  iex>     {4, [{2, 2, :nappy_change}, {1, 1, :sleep_check}]},
  iex>     {1, [{1, 1, :nappy_change}, {1, 1, :sleep_check}, {2, 2, :nappy_change}]}
  iex>   ]}
  iex> ])
  [7, 8]
  """
  def final_numbers(crunches) do
    crunches
    |> Enum.map(fn {:final, n, _} ->
      n
    end)
  end

  def shortest_path(crunches) do
    crunches
    |> Enum.min_by(fn {:final, n, _} ->
      n
    end)
  end
end
