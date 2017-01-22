gulp       = require 'gulp'
autowatch  = require 'gulp-autowatch'
concat     = require 'gulp-concat'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'
cp         = require 'child_process'
stylus     = require 'gulp-stylus'
coffeeify  = require 'coffeeify'
browserify = require 'browserify'

paths =
  public: './public'
  elm:    './src/elm/*.elm'
  css:    './src/css/*.styl'
  coffee: './src/js/*.coffee'

gulp.task 'coffee', ->
  bCache = {}
  b = browserify './src/js/app.coffee',
    debug: true
    interestGlobals: false
    cache: bCache
    extensions: ['.coffee']
  b.transform coffeeify
  b.bundle()
  .pipe source 'app.js'
  .pipe buffer()
  .pipe gulp.dest paths.public

gulp.task 'stylus', ->

  stylSrc = (file) ->
    "./src/css/" + file + ".styl"

  stylFiles = [
    stylSrc "font-families"
    stylSrc "colors"
    stylSrc "main"
    stylSrc "*"
  ]

  gulp.src stylFiles
  .pipe (concat "style.styl")
  .pipe stylus()
  .pipe gulp.dest paths.public

gulp.task 'elm', ->  
  cmd  = 'elm-make '
  cmd += './src/elm/main.elm'
  cmd += ' --output '
  cmd += './public/elm.js'

  cp.exec cmd, (error, stdout) ->
    if error
      console.log "Elm error :^( "
      console.log error
    else
      console.log 'Elm says .. '
      console.log (stdout.slice 0, stdout.length - 1)

gulp.task 'watch', ->
  autowatch gulp,
    server:   './public/*.html'
    stylus:   paths.css
    coffee:   paths.coffee
    elm:      "./src/elm/**/*.elm"

gulp.task 'server', -> require './server'

gulp.task 'default', 
  [ 'elm', 'coffee', 'stylus', 'watch', 'server' ]





 