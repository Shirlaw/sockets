var gulp = require('gulp');
var coffee = require('gulp-coffee');
var concat = require("gulp-concat");
var include = require("gulp-include");
var gulpEjs = require('gulp-ejs-template');

gulp.task('default', function() {
  // place code for your default task here
});

gulp.task('compile-coffee', function () {
    gulp.src('./javascript/app.coffee') // path to your file
      .pipe(include())
      .pipe(coffee())
      .pipe(gulp.dest('assets/js'));
});

gulp.task('compile-templates', function () {
  gulp.src('javascript/tpl/*.html')
    .pipe(gulpEjs({
      moduleName: 'templates'
    }))
    .pipe(gulp.dest('assets/js'));
});

gulp.task('start', function(){
  gulp.watch(['./javascript/tpl/*.html'], ['compile-templates'])
  gulp.watch(['./javascript/*.coffee', './javascript/**/*.coffee', './javascript/**/**/*.coffee', './javascript/**/**/*.coffee'], ['compile-coffee'])
});