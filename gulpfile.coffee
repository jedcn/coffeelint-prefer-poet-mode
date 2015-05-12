gulp = require 'gulp'
coffee = require 'gulp-coffee'
mocha = require 'gulp-mocha'

src = './src/*.coffee'
test = './test/*.coffee'

gulp.task('compile', ->
  gulp.src(src)
    .pipe(coffee())
    .pipe(gulp.dest('./src'))
)

gulp.task('test', ->
  gulp.src(test)
    .pipe(mocha({ reporter: 'list' }))
)

gulp.task('watch', ->
  gulp.watch([src, test], ['test'])
)

gulp.task('default', ['compile', 'test'])
