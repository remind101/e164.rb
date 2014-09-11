# E164

A clone of [remind101/e164.js](https://github.com/remind101/e164.js) using the awesome power of regex.

Run `rake rebuild` to bring this module into sync with e164.js.

## Usage

```ruby
> E164::lookup('14032347847')
 => ["CA", "Canada"]
```

Just like the real e164.js, you should strip all non-numeric characters before performing the lookup.
