var gulp = require('gulp');
var coffee = require('gulp-coffee');
var concat = require("gulp-concat");
var include = require("gulp-include");
var gulpEjs = require('gulp-ejs-template');
var sass = require('gulp-sass');
var plumber = require('gulp-plumber');

gulp.task('default', function() {
  // place code for your default task here
});

gulp.task('compile-coffee', function () {
  gulp.src('./coffeescript/app.coffee') // path to your file
    .pipe(plumber())
    .pipe(include())
    .pipe(coffee())
    .pipe(gulp.dest('assets/js')
  );
});

gulp.task('compile-templates', function () {
  gulp.src('coffeescript/tpl/*.html')
    .pipe(plumber())
    .pipe(gulpEjs({
      moduleName: 'templates'
    }))
    .pipe(gulp.dest('assets/js')
  );
});

gulp.task('sass', function () {
  gulp.src('./sass/app.scss')
    .pipe(include())
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./assets/css')
  );
});

gulp.task('watch', function(){
  gulp.watch(['./coffeescript/tpl/*.html'], ['compile-templates'])
  gulp.watch(['./coffeescript/*.coffee', './coffeescript/**/*.coffee', './coffeescript/**/**/*.coffee', './coffeescript/**/**/*.coffee'], ['compile-coffee'])
  gulp.watch(['./sass/**/*.scss'], ['sass']);
});