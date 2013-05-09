Memcached = require 'memcached'
settings = require 'node_settings_module'

memcached = null

key_namespace = settings.get("memcached").key_namespace

exports.get = (cache_key, callback) ->
  key = key_namespace + cache_key
  memcached.get key, (error, result) ->
    console.log error if error
    callback result

exports.delete = (cache_key, callback) ->
  key = key_namespace + cache_key
  memcached.delete key, (error, result) ->
    console.log error if error
    callback result if callback

exports.set = (cache_key, value, timeout, callback) ->
  key = key_namespace + cache_key
  memcached.set key, value, timeout, (error, result) ->
    console.log error if error
    callback result if callback

prepare_connection = () ->
  # memcached client (uses a connection pool)
  memcached = new Memcached(settings.get("memcached").servers)

prepare_connection()
