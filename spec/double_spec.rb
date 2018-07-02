require "spec_helper"

RSpec.describe "Using Doubles" do
  # Instead of using instances in these tests, 
  # replace each of these with a 'leaf' test double
  it "has a green color" do
    tree = Tree.new
    branch = Branch.new(tree)
    leaf = Leaf.new(branch)

    expect(leaf.color).to eq("green")

    expect(leaf).to_not be_instance_of(Leaf)
  end

  it "has a branch that is of 4 feet in length" do
    tree = Tree.new
    branch = Branch.new(tree)
    leaf = Leaf.new(branch)

    expect(leaf.branch.length).to eq("4 feet")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
  end

  it "has a tree with thick and brown bark" do
    tree = Tree.new
    branch = Branch.new(tree)
    leaf = Leaf.new(branch)

    expect(leaf.branch.tree.bark).to eq("thick and brown")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
    expect(leaf.branch.tree).to_not be_instance_of(Tree)
  end
end
