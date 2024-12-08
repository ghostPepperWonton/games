alias Games.Application
alias Games.Rank

Application.start(:normal, [])

seeds = [
  %{order: 1, letter: "S", description: "I'll never shut up about this"},
  %{order: 2, letter: "A", description: "Top 10 contender"},
  %{order: 3, letter: "B", description: "What a great time"},
  %{order: 4, letter: "C", description: "Cool, but flawed"},
  %{order: 5, letter: "D", description: "Forgettable"},
  %{order: 6, letter: "F", description: "Don't play this game"},
]

Enum.each(seeds, &Rank.new/1)
