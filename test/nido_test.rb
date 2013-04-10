require_relative "../lib/nido.rb"

# Creating namespaces.
scope do
  test "return the namespace" do
    n1 = Nido.new("foo")
    assert "foo" == n1
  end

  test "prepend the namespace" do
    n1 = Nido.new("foo")
    assert "foo:bar" == n1["bar"]
  end

  test "work in more than one level" do
    n1 = Nido.new("foo")
    n2 = Nido.new(n1["bar"])
    assert "foo:bar:baz" == n2["baz"]
  end

  test "be chainable" do
    n1 = Nido.new("foo")
    assert "foo:bar:baz" == n1["bar"]["baz"]
  end

  test "accept symbols" do
    n1 = Nido.new(:foo)
    assert "foo:bar" == n1[:bar]
  end

  test "accept numbers" do
    n1 = Nido.new("foo")
    assert "foo:3" == n1[3]
  end
end
