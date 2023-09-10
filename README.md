# Playdate Blackbox Puzzles

Building some [Black Box Puzzles](http://blackboxpuzzles.workroomprds.com/) for Panic's [Playdate](https://play.date/)

Black Box Puzzles are a creation of [James Lyndsay](https://www.workroom-productions.com/)


## Notes
- `pdc -k <input>`
- Sublime build system: `"cmd": ["pdc", "-k", "$folder"]`
- `pdc -k source pbbp.pdx`
- `pdc -k -I source tests pbbp-tests.pdx` requires copy of assets into tests folder


## Used in this repo
- Playdate SDK
- Mozart NBP Font by total FontGeek DTF, Ltd.

## Testing
- followed instructions mentioned below
- requires building the tests, then running them in the simulator
- not sure what `testOutputFilename` does
- ToDo: figure out how to get fonts and images into `tests`
- Makefile: `cp` with `-u` (update, UPDATE={all,none,older(default)} ) or `-n` (no-clobber, i.e. no overwrites)

---

## ToDos
- `pdc` without `./tests`
- add https://github.com/mpeterv/luacheck

---

## Useful links

### Playdate SDK
- https://play.date/dev/
- https://play.date/dev/links/
- https://sdk.play.date/2.0.3/Inside%20Playdate.html

### Unit testing with the Playdate SDK
- https://devforum.play.date/t/unit-testing-game-lib/2083

### Testing Lua
- https://martin-fieber.de/blog/how-to-test-your-lua/
- https://github.com/mockagne/mockagne
- https://github.com/henry4k/lua-mock

### Lua
- https://learnxinyminutes.com/docs/lua/

### Pixel art
- Gimp: https://www.youtube.com/watch?v=oAaoh49yf5A

### Fonts
- font conversion: https://kaasiand.cool/tophat/
- load fonts without file extention: `gfx.font.new("fonts/JetBrainsMono-Medium-20")`

### Makefile
- https://makefiletutorial.com/
