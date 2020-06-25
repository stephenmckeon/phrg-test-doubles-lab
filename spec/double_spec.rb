require "spec_helper"

RSpec.describe "Doubles" do
  # Instead of using instances in these tests,
  # replace each of these with a 'leaf' test double
  it "leaf returns expected color" do
    leaf = double("Equals green", color: "green" )

    expect(leaf.color).to eq("green")

    expect(leaf).to_not be_instance_of(Leaf)
  end

  it "leaf's branch returns expected length" do
    branch = double("Branch", length: "4 feet")
    leaf = double("Leaf", branch: branch)

    expect(leaf.branch.length).to eq("4 feet")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
  end

  it "leaf's branch's tree returns expected bark" do
    tree = double("Tree", bark: "thick and brown")
    branch = double("Branch", tree: tree)
    leaf = double("Leaf", branch: branch)

    expect(leaf.branch.tree.bark).to eq("thick and brown")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
    expect(leaf.branch.tree).to_not be_instance_of(Tree)
  end
end
