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
  other_settings = 
    retries : 1
    retry : 100
    remove : false
    timeout : 100
    reconnect : 500
  memcached = new Memcached(settings.get("memcached").servers, other_settings)

prepare_connection()
