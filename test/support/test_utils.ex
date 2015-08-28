defmodule Gcommerce.TestUtils do
  defp random(max \\ 999999999999999999) do
    :random.seed(:erlang.now)
    :random.uniform(max)
  end
end
