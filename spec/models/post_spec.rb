require 'rails_helper'

describe Post do
  it { should belong_to(:creator)
    .with_foreign_key('user_id')
    .class_name('User') }
  it { should have_many(:comments) }
  it { should have_many(:post_tags) }
  it { should have_many(:tags).through(:post_tags) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_most(3838) }
end
