require 'rails_helper'

describe Comment do
  it { should belong_to(:creator)
    .with_foreign_key('user_id')
    .class_name('User') }
  it { should belong_to(:post) }
  it { should validate_presence_of(:body) }
end
