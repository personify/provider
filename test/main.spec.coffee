should = require 'should'
nomad = require '../domain/main'
require 'sugar'
Object.extend()

describe 'nomad', ->
  it 'should return an application node', (done) ->
    app = nomad.loadApp 'fs', './example'
    app.keys().should.include ['domain', 'README', 'todo.coffee']
    done()

    #each further property dereference builds up an internal file path
    app.domain.todoList._models

    #calling the node as a function evaluates the path and gives you directory info
    app.domain.todoList._models (err, file) ->
      unless err
        if file.isDirectory
          console.log file.list
        else
          console.log file.read()

    app.get "./pathspec", (err, file) ->

