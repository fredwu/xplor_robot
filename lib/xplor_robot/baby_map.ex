defmodule XplorRobot.BabyMap do
  defstruct map: %{
    {1, 1} => [
      :nappy_change,
      :sleep_check,
    ],
    {2, 2} => [
      :nappy_change,
    ],
    {2, 3} => [
      :nappy_change,
      :sleep_check,
    ],
    {1, 3} => [
      :sleep_check,
      :food,
    ],
  }
end
