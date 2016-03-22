'use strict'
path      = require 'path'
gulp      = require 'gulp'
mocha     = require 'gulp-mocha'
istanbul  = require 'gulp-istanbul'
nsp       = require 'gulp-nsp'
plumber   = require 'gulp-plumber'
coveralls = require 'gulp-coveralls'
coffee    = require 'gulp-coffee'
cache     = require 'gulp-cached'
gutil     = require 'gulp-util'
del       = require 'del'
coffeelint  = require 'gulp-coffeelint'
source      = require 'vinyl-source-stream'
runSequence = require 'gulp-run-sequence'
browserify  = require 'browserify'
coffeeify   = require 'coffeeify'
uglify      = require 'gulp-uglify'
rename      = require 'gulp-rename'
excludeGitignore = require 'gulp-exclude-gitignore'


gulp.task 'nsp', (cb) ->
  nsp { package: path.resolve('package.json') }, cb
  return

gulp.task 'clean', (done)->
  del [
    'lib'
    'dist'
  ], done

gulp.task 'coffeelint', ['clean'], ->
  gulp.src 'src/**/*.coffee'
  .pipe cache( 'js' )
  .pipe coffeelint()
  .pipe(coffeelint.reporter())
  .pipe(coffeelint.reporter('fail'))
  .pipe gutil.noop()

browserifyTask = (t) ->
  gulp.task "#{t}.coffee", ->
    browserify
      entries: ["./src/#{t}.coffee"]
      extensions: ['.coffee', '.js']
    .transform coffeeify
    .bundle()
    # Pass desired file name to browserify with vinyl
    .pipe source "#{t}.js"
    # Start piping stream to tasks!
    .pipe gulp.dest 'dist'

browserifyTask "format-phone", true

gulp.task 'copyResources', ->
  gulp.src(['./src/resources/**/*/*.*'])
  .pipe gulp.dest('./dist/resources/')
  return

gulp.task 'compressjs', () -> 
  gulp.src ['dist/format-phone.js']
    .pipe uglify({ outSourceMap: true })
    .pipe rename
      suffix: '.min'
    .pipe gulp.dest 'dist'

gulp.task 'watch', ->
  gulp.watch [
    'src/*.coffee'
    'test/**'
  ], [ 'test' ]
  return

gulp.task 'copyResources', ->
  gulp.src(['./src/resources/**/*/*.*'])
  .pipe gulp.dest('./dist/resources/')
  return

gulp.task 'watch', ->
  gulp.watch [
    'src/*.coffee'
    'test/**'
  ], [ 'test' ]
  return

gulp.task 'compile', ['coffeelint'], ->
  gulp.src(['src/**/*.coffee'])
  .pipe coffee()
  .pipe gulp.dest 'lib'

gulp.task 'pre-test', ['compile'], ->
  gulp.src 'lib/**/*.js'
  .pipe excludeGitignore()
  .pipe istanbul(includeUntested: true)
  .pipe istanbul.hookRequire()

gulp.task 'test', [ 'pre-test' ], () ->
  mochaErr = undefined
  gulp.src(['test/**/*.coffee'], { read: false })
    .pipe plumber() 
    .pipe mocha({
      compilers: 'coffee:coffee-script/register'
      timeout: 120000
      reporter: 'spec'
      recursive: true
      })
    .on 'error', (err) ->
      mochaErr = err
      gutil.log
      return
    .pipe(istanbul.writeReports()).on 'end', ->
      cb mochaErr
      return
    
gulp.task 'watch', ->
  gulp.watch [
    'lib/**/*.js'
    'test/**'
  ], [ 'test' ]
  return

gulp.task 'coveralls', [ 'test' ], ->
  if !process.env.CI
    return
  gulp.src(path.join(__dirname, 'coverage/lcov.info')).pipe coveralls()

gulp.task 'prepublish', [ 'nsp']

gulp.task 'default', [
  'test'
  'coveralls'
]

gulp.task 'bower', (cb) ->
  runSequence 'clean', ['format-phone.coffee', 'copyResources','coffeelint', 'compile'], 'compressjs', cb


