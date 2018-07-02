# Test Doubles

A 'test double' is a generic term that stands for any object or procedure that is used as a substitute for a piece of an application under test. RSpec uses an appropriately named `double` method to create such an object. [Read their documentation on test doubles here](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/basics/test-doubles).

## Why Use Doubles

There often arise scenarios in tests that require establishing state for code that is not specifically under test. 

For example, you may be testing an assertion that a method returns a record when a response from an outside source is successful (lets use Google). But during that method, you do not want the code to actually make a request to Google. Your test is not there to check any behavior with Google, it just wants to verify that the code returns the right record when the `call` is successful. Perhaps the method looks like this:

```ruby
def method_under_test(arg)
  if arg.call_to_google
    Record.find(name: "foo")
  end
end
```

Using a `double` method to test this assertion could look like:

```ruby
RSpec.describe "#method_under_test" do
  it "returns Record with id of 2" do
    arg = double("descriptive name", call_to_google: true)
    expect(method_under_test(arg)).to eq(Record.find(name: "foo"))
  end
end
```

Lets break down the execution code in the example above.

```ruby
arg = double("descriptive name for this double", call_to_google: true)
```

This line creates an `arg` variable that holds a `double` object. This object has a name of `"descriptive name"`, and then a hard coded value of `true` that is returned when `#call_to_google` is called upon it.

```ruby
expect(method_under_test(arg)).to eq(Record.find(name: "foo"))
```

In this line, our `arg` double is passed to `method_under_test`. We expect this invocation to return a `Record` object with a `name` of `foo`.

## Solving This Lab

To solve this lab, replace the application objects in the test file with `double`s. In each test, you can remove the first three lines that create a `tree`, `branch`, and `leaf` instance. Instead, replace the lines with a `double` named leaf that creates all the functionality needed to pass the tests.

## Types of Test Doubles

There are 5 types common types of test doubles. The above example is called a `Mock`. These types are

- Mocks
- Stubs
- Spies
- Dummy objects
- Fake objects

To learn more about these different kinds of doubles, check out [Stubs, Mocks and Spies in RSpec](https://about.futurelearn.com/blog/stubs-mocks-spies-rspec) and [Mocks aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html).

## Resources

- [RSpec-Mocks documentation](https://relishapp.com/rspec/rspec-mocks/v/3-7/docs/basics)
- [Stubs, Mocks and Spies in RSpec](https://about.futurelearn.com/blog/stubs-mocks-spies-rspec)
- [Mocks aren't Stubs](https://martinfowler.com/articles/mocksArentStubs.html)
