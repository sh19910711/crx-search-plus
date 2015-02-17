gulp = require("gulp")

gulp.task "manifest.json", ->
  gulp.src ["src/manifest.json"]
    .pipe gulp.dest("dist/")

gulp.task "img", ->
  gulp.src ["src/img/*.png"]
    .pipe gulp.dest("dist/img/")

gulp.task "build", [
  "manifest.json"
  "img"
]
