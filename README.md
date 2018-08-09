# Test Doubles

A "test double" is a generic term that stands for any object or procedure that serves as a substitute for a unit of code during a test. RSpec uses an appropriately named `double` method to create such an object. [Read RSpec documentation on test doubles here](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/basics/test-doubles).

## Why Use Doubles

There are often times when it is necessary to setup code that is not specifically under test. Instead of using actual objects in use in your application code, it may be appropriate to use a test double.

For example, one may be testing that a method returns a record object, but only when a response from an outside source is successful (let's use Google as an example). When testing of such a method, we would not want to actually make a request to Google, as that takes time and is outside the scope of what we want to ensure. Your test is not there to check any behavior with Google, it just wants to verify that the method returns the right record when a `call_to_google` is successful. Such a method could look like:

```ruby
def method_under_test(arg)
  if arg.call_to_google
    Record.find(name: "foo")
  end
end
```

Using a `double` to test this assertion:

```ruby
RSpec.describe "#method_under_test" do
  it "returns Record with id of 2" do
    arg = double("Successfully responds", call_to_google: true)
    expect(method_under_test(arg)).to eq(Record.find(name: "foo"))
  end
end
```

Let's break down the execution code in the example above.

```ruby
arg = double("Successfully responds", call_to_google: true)
```

This line creates an `arg` variable that holds a `double` object. This object has a name of `"Successfully responds"`, and then a value of `true` that will be returned when `#call_to_google` is called on `arg`.

```ruby
expect(method_under_test(arg)).to eq(Record.find(name: "foo"))
```

In this line, our `arg` double object is passed to `method_under_test`. We expect this invocation to return a `Record` object with a `name` of `foo`.

## Solving This Lab

To solve this lab, replace the application objects within the test file with `double`s. In each example, you can remove the first three lines that create a `tree`, `branch`, and `leaf` instance. Replace these lines with a `double` named 'leaf' that creates the functionality needed to pass the given expectations. Leave the `expect`ations unchanged.

## Types of Test Doubles

There are 5 types of test doubles. The above is an example a mock. These 5 types are:

- Mocks
- Stubs
- Spies
- Dummy objects
- Fake objects

To learn more about the various types of doubles, check out [Stubs, Mocks and Spies in RSpec](https://about.futurelearn.com/blog/stubs-mocks-spies-rspec) and [Mocks aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html).

## Resources

- [RSpec-Mocks documentation](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/basics)
- [Stubs, Mocks and Spies in RSpec](https://about.futurelearn.com/blog/stubs-mocks-spies-rspec)
- [Mocks aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html)
