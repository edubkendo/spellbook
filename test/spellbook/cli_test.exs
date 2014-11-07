defmodule Spellbook.CLITest do
  use ExUnit.Case

  import Spellbook.CLI, only: [ parse_args: 1,
                                process: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "code string returned when --code passed" do
    assert parse_args(["--code", "Enum."]) == %{ code: "Enum." }
  end

  test "process returns completions" do
    assert process(%{code: "IO."}) == {:yes, [],
                  ['binread/2', 'binstream/2', 'binwrite/2', 'chardata_to_string/1', 'getn/3',
                   'getn/2', 'gets/2', 'inspect/3', 'inspect/2', 'iodata_length/1',
                   'iodata_to_binary/1', 'puts/2', 'read/2', 'stream/2', 'write/2', 'ANSI']}
  end
end
