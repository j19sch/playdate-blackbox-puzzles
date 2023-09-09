# Playdate Blackbox Puzzles

Building some [Black Box Puzzles](http://blackboxpuzzles.workroomprds.com/) for Panic's [Playdate](https://play.date/)

Black Box Puzzles are a creation of [James Lyndsay](https://www.workroom-productions.com/)


## Notes
- `pdc -k <input>`
- Sublime build system: `"cmd": ["pdc", "-k", "$folder"]`


## Used in this repo
- Playdate SDK
- Mozart NBP Font by total FontGeek DTF, Ltd.

## Testing
- followed instructions mentioned below
- requires building the tests, then running them in the simulator
- not sure what `testOutputFilename` does

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

### Lua
- https://learnxinyminutes.com/docs/lua/

### Pixel art
- Gimp: https://www.youtube.com/watch?v=oAaoh49yf5A

### Fonts
- font conversion: https://kaasiand.cool/tophat/
- load fonts without file extention: `gfx.font.new("fonts/JetBrainsMono-Medium-20")`
