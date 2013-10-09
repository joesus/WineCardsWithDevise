# # == Schema Information
# #
# # Table name: comments
# #
# #  id         :integer          not null, primary key
# #  content    :string(255)
# #  user_id    :integer
# #  wine_id    :integer
# #  created_at :datetime
# #  updated_at :datetime
# #

# require 'spec_helper'

# describe Comment do
# 	let(:user) { FactoryGirl.create(:user) }
# 	before { @comment = user.comments.build(content: "Tasty") }

# 	subject { @comment }

# 	it { should respond_to(:content) }
# 	it { should respond_to(:user_id) }
# 	it { should respond_to(:user) }
# 	its(:user) { should eq user }

# 	it { should be_valid }

# 	describe "when user_id is not present" do
# 		before { @comment.user_id = nil }
# 		it { should_not be_valid }
# 	end

# 	describe "with blank content" do
# 		before { @comment.content = " " }
# 		it { should_not be_valid }
# 	end

# 	describe "with content that is too long" do
# 		before { @comment.content = "a" * 251 }
# 		it { should_not be_valid }
# 	end
# end
