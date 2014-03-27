ntp Cookbook
============

Attributes
----------

なし

Usage
-----
#### ntp::default

e.g.
Just include `ntp` in your node's `run_list`:

※ ntpのサーバーを設定する必要あり

```json
{
  "ntp": {
	"servers": [ "ntp.nict.jp"]
  },

  "run_list": [
    "ntp"
  ]
}
```

Contributing
------------

e.g.

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: KAYAC
