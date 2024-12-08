alias Games.Application
alias Games.Ownership
alias Games.Rank

Application.start(:normal, [])

[
  %{order: 1, letter: "S", description: "I'll never shut up about this"},
  %{order: 2, letter: "A", description: "Top 10 contender"},
  %{order: 3, letter: "B", description: "What a great time"},
  %{order: 4, letter: "C", description: "Cool, but flawed"},
  %{order: 5, letter: "D", description: "Forgettable"},
  %{order: 6, letter: "F", description: "Don't play this game"},
]
|> Enum.each(&Rank.new/1)

[
  # PC
  %{type: :have, platform: :pc, format: :digital, library: :steam},
  %{type: :have, platform: :pc, format: :digital, library: :epic},
  %{type: :have, platform: :pc, format: :digital, library: :ea},
  %{type: :have, platform: :pc, format: :digital, library: :itch},
  %{type: :have, platform: :pc, format: :digital, library: :gog},

  %{type: :share, platform: :pc, format: :digital, library: :steam},

  %{type: :want, platform: :pc, format: :digital, library: :steam},
  %{type: :want, platform: :pc, format: :digital, library: :epic},
  %{type: :want, platform: :pc, format: :digital, library: :ea},
  %{type: :want, platform: :pc, format: :digital, library: :itch},
  %{type: :want, platform: :pc, format: :digital, library: :gog},

  %{type: :wish, platform: :pc, format: :digital, library: :steam},
  %{type: :wish, platform: :pc, format: :digital, library: :epic},
  %{type: :wish, platform: :pc, format: :digital, library: :ea},
  %{type: :wish, platform: :pc, format: :digital, library: :itch},
  %{type: :wish, platform: :pc, format: :digital, library: :gog},

  %{type: :have, platform: :pc, format: :physical},
  %{type: :have, platform: :pc, format: :rom},
  %{type: :have, platform: :pc, format: :exe},

  %{type: :want, platform: :pc, format: :rom},

  # Gadgets
  %{type: :have, platform: :mobile, format: :digital},
  %{type: :have, platform: :vr, format: :digital},

  # ROM
  %{type: :have, platform: :three_ds, format: :rom},
  %{type: :have, platform: :dreamcast, format: :rom},
  %{type: :have, platform: :ds, format: :rom},
  %{type: :have, platform: :gb, format: :rom},
  %{type: :have, platform: :gbc, format: :rom},
  %{type: :have, platform: :gba, format: :rom},
  %{type: :have, platform: :genesis, format: :rom},
  %{type: :have, platform: :n64, format: :rom},
  %{type: :have, platform: :nes, format: :rom},
  %{type: :have, platform: :ngc, format: :rom},
  %{type: :have, platform: :ps1, format: :rom},
  %{type: :have, platform: :ps2, format: :rom},
  %{type: :have, platform: :ps3, format: :rom},
  %{type: :have, platform: :psp, format: :rom},
  %{type: :have, platform: :saturn, format: :rom},
  %{type: :have, platform: :snes, format: :rom},
  %{type: :have, platform: :wii, format: :rom},
  %{type: :have, platform: :wiiu, format: :rom},
  %{type: :have, platform: :xbox, format: :rom},
  %{type: :have, platform: :xbox360, format: :rom},

  %{type: :want, platform: :three_ds, format: :rom},
  %{type: :want, platform: :dreamcast, format: :rom},
  %{type: :want, platform: :ds, format: :rom},
  %{type: :want, platform: :gb, format: :rom},
  %{type: :want, platform: :gbc, format: :rom},
  %{type: :want, platform: :gba, format: :rom},
  %{type: :want, platform: :genesis, format: :rom},
  %{type: :want, platform: :n64, format: :rom},
  %{type: :want, platform: :nes, format: :rom},
  %{type: :want, platform: :ngc, format: :rom},
  %{type: :want, platform: :ps1, format: :rom},
  %{type: :want, platform: :ps2, format: :rom},
  %{type: :want, platform: :ps3, format: :rom},
  %{type: :want, platform: :psp, format: :rom},
  %{type: :want, platform: :saturn, format: :rom},
  %{type: :want, platform: :snes, format: :rom},
  %{type: :want, platform: :wii, format: :rom},
  %{type: :want, platform: :wiiu, format: :rom},
  %{type: :want, platform: :xbox, format: :rom},
  %{type: :want, platform: :xbox360, format: :rom},

  # Consoles
  %{type: :have, platform: :ps4, format: :digital},
  %{type: :have, platform: :ps4, format: :physical},

  %{type: :want, platform: :ps4},
  %{type: :wish, platform: :ps4},

  %{type: :have, platform: :switch, format: :digital},
  %{type: :have, platform: :switch, format: :physical},

  %{type: :want, platform: :switch},
  %{type: :wish, platform: :switch},
]
|> Enum.each(&Ownership.new/1)
