module.exports = (grunt) ->
  'use strict'

  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'


  grunt.initConfig
    connect:
      dev:
        options:
          port: 8080
          base: '.tmp'
          hostname: '*'
          livereload: true

    watch:
      dev:
        files: ['app/**/*']
        tasks: ['sass:dev', 'copy:dev']
        options:
          livereload: true

    sass:
      dev:
        files:
          '.tmp/styles/main.css': ['app/styles/**/*.scss']
      dist:
        files:
          '.dist/styles/main.css': ['app/styles/**/*.scss']
        options:
          style: 'compressed'

    copy:
      dev:
        files: [
          src: 'app/index.html'
          dest: '.tmp/index.html'
        ]
      dist:
        files: [
          src: 'app/index.html'
          dest: '.dist/index.html'
        ]

    clean:
      dev: ['.tmp']
      dist: ['.dist']



  grunt.registerTask 'default', [
    'clean:dev'
    'copy:dev'
    'sass:dev'
    'connect:dev'
    'watch:dev'
  ]

  grunt.registerTask 'dist', [
    'clean:dist'
    'copy:dist'
    'sass:dist'
  ]

