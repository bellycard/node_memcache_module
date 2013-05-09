node_memcache_module
==================

A module to wrap memcache and apply our settings

### Installation

Add to your dependencies in package.json, with a reference to this repository

```JAVASCRIPT
"dependencies": {
  "node_memcache_module": "git://github.com/bellycard/node_memcache_module.git#v0.0.2"
}
```

### Usage

```JAVASCRIPT
mc = require('node_memcache_module')

key = "some_cache_key"
mc.set key, "value", 60, () ->
  mc.get key, (result) ->
    console.log result
    mc.delete key, () ->
      console.log "key deleted"
```

### Settings

```JSON
{
  "development": {
    "memcached": {
      "servers": ["localhost:11211"],
      "key_namespace" : "something_to_prefix_all_keys_and_avoid_collisions"
    }
  }
}
```

### Development

Source files are written in coffee, and compiled into JavaScript.  To watch the src directory and compile js into the add directory
```
coffee -c -b -w -o app/ src/
```
