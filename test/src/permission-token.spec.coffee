
assert  = require 'assert'
Token   = require '../../src/permission-token.coffee'

describe 'Permission Token', ->

  describe 'PermissionToken Type', ->

    it 'should return the given string', ->
      expected  = 'test'
      actual    = Token.PermissionToken 'test'
      assert.equal actual, expected

  describe 'actionOrDefault', ->

    it 'should return the given string without the ending "!" ' +
    'if it ends with "!".', ->

      expected  = 'test'
      actual    = Token.actionOrDefault 'test!'
      assert.equal actual, expected

    it 'should return the default token if the string does not end in "!"', ->

      expected  = '*'
      actual    = Token.actionOrDefault 'test'
      assert.equal actual, expected

    it 'should return the given default if the token doesn\'t endin "!"', ->

      expected  = 'my-default'
      actual    = Token.actionOrDefault 'test', 'my-default'
      assert.equal actual, expected

  describe 'getLastItem', ->

    it 'should return the last token', ->

      expected  = 'test!'
      actual    = Token.getLastItem 'my:fancy:test!'
      assert.equal actual, expected

    it 'should return an empty string given an empty string', ->

      expected  = ''
      actual    = Token.getLastItem ''
      assert.equal actual, expected

  describe 'isAction', ->

    it 'should return true if the last character is an "!"', ->

      expected  = true
      actual    = Token.isAction 'test!'
      assert.equal actual, expected

    it 'should return false if the last character is not an "!"', ->

      expected  = false
      actual    = Token.isAction 'test'
      assert.equal actual, expected

  describe 'hasAction', ->

    it 'should return true if the last item is an action', ->

      expected  = true
      actual    = Token.hasAction 'my:test:token:action!'
      assert.equal actual, expected

    it 'should return false if the last item is not an action', ->

      expected  = false
      actual    = Token.hasAction 'my:test:token'
      assert.equal actual, expected

  describe 'getAction', ->

    it 'should return the last token if it ends in a "!"', ->

      expected  = 'test'
      actual    = Token.getAction 'my:fancy:test!'
      assert.equal actual, expected

    it 'should return the specified default if the last token ' +
      'doesn\'t end in an "!"', ->

      expected  = 'my-default'
      actual    = Token.getAction 'my:fancy:test', 'my-default'
      assert.equal actual, expected

  describe 'addAction', ->

    it 'should add an action to the end of the given token', ->

      expected  = 'my:fancy:test!'
      actual    = Token.addAction 'my:fancy', 'test'
      assert.equal actual, expected
