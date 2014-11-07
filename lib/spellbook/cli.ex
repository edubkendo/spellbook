defmodule Spellbook.CLI do

  @moduledoc """
  Take in code from the command line and return a list of completions.
  """

  def main(argv) do
    argv
    |> parse_args
    |> process
    |> out
  end

  def out({ :yes, _, completions }) do
    for c <- completions, do: IO.puts(c)
    System.halt(0)
  end

  def out(str) do
    IO.puts str
    System.halt(0)
  end

  def process(:help) do
    """
    usage: spellbook --code <code>
    """
  end

  def process(%{ code: code }) do
    code
    |> String.to_char_list
    |> Spellbook.Completions.complete
  end

  @doc """
  `argv` can be -h or --help, or --code followed by a line of code to complete.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, [ switches: [ help: :boolean,
                                                 code: :string ],
                                       aliases:  [ h:    :help ]])
    case parse do
      { [ help: true ], _, _ } -> :help
      { [ code: code ], _, _ } ->  %{ code: code }
      _ -> :help
    end
  end
end
