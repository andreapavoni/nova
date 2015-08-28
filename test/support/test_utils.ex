defmodule Gcommerce.TestUtils do
  def random(max \\ 999999999999999999) do
    :random.seed(:erlang.now)
    :random.uniform(max)
  end
end
