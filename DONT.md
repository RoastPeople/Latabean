# DONT:
#
#
#

- don't reuse _, put a local on it, so we don't keep around trash

-- swithc X with Func

- error with stray comma at end of line

* multiline comments
* table slices (almost)

* combine for and if line decorators

* allow return anywhere in block

-- all function literals have a string that is their function definition

-- super should work here:

thing = Thing!
thing.method = ->
	super 1,2,3

-- goes to

thing.method = function(self) do
	self.__class:method(1,2,3)
end
