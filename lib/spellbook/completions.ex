defmodule Spellbook.Completions do

  @doc """
  Takes the code from the editor and generates completions.
  
  ## Example
    iex(1)> Spellbook.Completions.complete('IO.')
    {:yes, [],
     ['binread/2', 'binstream/2', 'binwrite/2', 'chardata_to_string/1', 'getn/3',
      'getn/2', 'gets/2', 'inspect/3', 'inspect/2', 'iodata_length/1',
      'iodata_to_binary/1', 'puts/2', 'read/2', 'stream/2', 'write/2', 'ANSI']}

  """
  def complete(code) do
    Enum.reverse(code)
    |> IEx.Autocomplete.expand
  end
end
