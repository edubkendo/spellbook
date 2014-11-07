defmodule Spellbook.CompletionsTest do
  use ExUnit.Case

  @example 'IO.'

  test "should return completions" do
		{:yes, _, completions} = Spellbook.Completions.complete @example
		assert Enum.count(completions) >= 1
  end
end
