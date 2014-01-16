require 'spec_helper'

describe User do

  describe ".top_rated" do
    before :each do
      post = nil
      topic = create(:topic)
      @u0 = create(:user) do |user|
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end

      @u1 = create(:user) do |user|
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
        post = user.posts.build(attributes_for(:post))
        post.topic = topic
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end
    end

    it "should return users based on comments + posts" do
      User.top_rated.should eq([@u1, @u0])
    end

    it "should have 'posts_count' on user" do
      users = User.top_rated
      users.first.posts_count.should eq(1)
    end

    it "should have `comments_count` on user" do
      users = User.top_rated
      users.first.comments_count.should eq(2)
    end
  end

  describe ".role?" do
    before :each do
      @uTest = create(:user)
    end

    it "should return true for role of 'member'" do
      @uTest.role?("member").should be_true
    end

    it "should return false for role of 'admin'" do
      @uTest.role?("moderator").should be_false
    end

    it "should return false for role of 'admin'" do
      @uTest.role?("admin").should be_false
    end
  end

end