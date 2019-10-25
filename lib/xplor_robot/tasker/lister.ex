defmodule XplorRobot.Tasker.Lister do
  @doc """
  iex> Lister.gen(%{
  iex>   {1, 1} => [
  iex>     :nappy_change,
  iex>     :sleep_check,
  iex>   ],
  iex>   {2, 2} => [
  iex>     :nappy_change,
  iex>   ],
  iex> })
  [
    {1, 1, :nappy_change},
    {1, 1, :sleep_check},
    {2, 2, :nappy_change},
  ]
  """
  def gen(input_map) do
    input_map
    |> Enum.map(fn {{x, y}, tasks} ->
      Enum.map(tasks, &{x, y, &1})
    end)
    |> List.flatten()
  end
end
