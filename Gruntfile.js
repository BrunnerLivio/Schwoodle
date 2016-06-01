// Generated on 2015-12-02 using generator-angular 0.14.0
'use strict';

// # Globbing
// for performance reasons we're only matching one level down:
// 'test/spec/{,*/}*.js'
// use this if you want to recursively match all subfolders:
// 'test/spec/**/*.js'

module.exports = function (grunt) {

  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.loadNpmTasks('grunt-php');
  grunt.loadNpmTasks('grunt-contrib-watch');
  
  grunt.registerTask('api', ['php', 'browserSync', 'watch']);
  
  
  
};
