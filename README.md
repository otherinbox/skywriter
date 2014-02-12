# Skywriter

Skywriter makes writing CloudFormation templates easier.



## Dependencies

When you are creating a resource, references to other resources 
will be added to the `DependsOn` key automatically.  If you have
additional dependencies which should be included in this key, 
they can be declared like this:

``` ruby
Resource.new("ResourceName", additional_dependencies: ['foo', 'bar'])
```

