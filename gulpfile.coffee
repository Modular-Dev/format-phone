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
coffeelint = require 'gulp-coffeelint'
excludeGitignore = require 'gulp-exclude-gitignore'


gulp.task 'nsp', (cb) ->
  nsp { package: path.resolve('package.json') }, cb
  return

gulp.task 'clean', (done)->
  del [
    'lib'
  ], done

gulp.task 'coffeelint', ['clean'], ->
  gulp.src 'src/**/*.coffee'
  .pipe cache( 'js' )
  .pipe coffeelint()
  .pipe(coffeelint.reporter())
  .pipe(coffeelint.reporter('fail'))
  .pipe gutil.noop()

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

gulp.task 'prepublish', [ 'nsp' ]

gulp.task 'default', [
  'test'
  'coveralls'
]