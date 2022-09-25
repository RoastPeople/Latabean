
# latabean spec guide

Because latabean is written in latabean, and latabean specs are written
in latabean, you need to be aware of which copy of latabean is actually
executing the specs.

A system installed version of latabean is recommended to run the specs (and
for development). This means that you'll typically have two versions of
latabean available in the load path:

* The system version
* The version in the current directory

> A system install is recommended because you'll always want a functioning
> version of latabean to compile with in case you break your development
> version.

When developing you want to make ensure the tests are executing your changes in
the current directory, and not testing the system install.

Code running in Busted will have the system install take precedence over the
loaded version. That means that if you `require "latabean.base"` for a test,
you won't get the local copy.

The `with_dev` spec helper will ensure that any require calls within the spec
that ask for latabean modules. `with_dev` calls a setup and teardown that
replaces `_G.require` with a custom version.

You'll use it like this:

```latabean
import with_dev from require "spec.helpers"
describe "latabean.base", ->
  with_dev!

  it "should load code", ->
    -- the local version is loaded
    latabean = require "latabean"
    latabean.load "print 12"
```


`with_dev`'s require function will load the `.lua` files in the local
directory, not the `lata` ones. You're responsible for compiling them first
before running the tests.

You might do

```bash
$ make compile_system; busted
```

> `make compile_system` is a makefile task included in the repo that will build
> latabean in the current directory with the version installed to the system

