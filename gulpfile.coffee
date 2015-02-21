gulp = require("gulp")

gulp.task "manifest.json", ->
  manifest  = require("./src/manifest")
  stream    = require("stream")
  gutil     = require("gulp-util")
  src       = stream.Readable(objectMode: true)
  src._read = ->
    @push new gutil.File
      cwd: ""
      base: ""
      path: "manifest.json"
      contents: new Buffer(JSON.stringify manifest)
    @push null
  src.pipe gulp.dest("dist/")

gulp.task "img", ->
  gulp.src ["src/img/*.png"]
    .pipe gulp.dest("dist/img/")

gulp.task "build", [
  "manifest.json"
  "img"
]
