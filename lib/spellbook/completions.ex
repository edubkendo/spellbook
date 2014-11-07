defmodule Spellbook.Completions do

  def complete(code) do
    Enum.reverse(code)
    |> IEx.Autocomplete.expand
  end
end
