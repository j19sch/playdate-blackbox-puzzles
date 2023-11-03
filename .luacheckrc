stds.elements = {
   globals = {
      "Button",
      "Circle",
      "Toggle",
      "Light",
      }
}

stds.puzzles = {
   globals = {
      "puzzle",
      "Puzzle001",
      "Puzzle001a",
      "Puzzle001b",
      "Puzzle001c",
      "Puzzle001d",
      "Puzzle001e",
      "Puzzle002",
      "Puzzle003",
      "Puzzle004",
   }
}

stds.main_etc = {
   globals = {
      "myGameSetUp",
      "game_state",
      "puzzle_loaded",
      "puzzle_menu_active_index",
      "puzzles001_menu_active_index",
      "puzzle_menu",
      "puzzles001_menu",
      "about"
   }
}

stds.tests = {
   globals = {
      "luaunit",
      "TestButton",
      "TestCircle",
      "TestToggle",
      "TestPuzzle001",
      "TestPuzzle002",
      "TestPuzzle003",
      "TestPuzzle001a",
      "TestPuzzle001b",
      "TestPuzzle001c",
      "TestPuzzle001d",
      "TestPuzzle001e",
   }
}

std = "lua54+playdate+elements+puzzles+main_etc"
operators = {"+=", "-=", "*=", "/="}

files["tests/**"] = {
   exclude_files = {"tests/luaunit/*"},  -- does not work, so done in Makefile
   std = std .. "+tests",
   self = false,
}
