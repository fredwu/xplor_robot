defmodule XplorRobot do
  alias XplorRobot.BabyMap
  alias XplorRobot.Tasker.{Cruncher, Lister}

  def start() do
    %BabyMap{}.map
    |> Lister.gen()
    |> Cruncher.crunch()
  end
end
