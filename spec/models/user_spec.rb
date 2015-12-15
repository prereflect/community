require 'rails_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password).on(:create) }
  it { should validate_length_of(:password).is_at_least(5) }
  it { should validate_length_of(:bio).is_at_most(140) }

  describe '#admin?' do
    it 'verifies user is an admin' do
      admin_user = build(:user, :admin)

      expect(admin_user.role).to eq('admin')
    end

    it 'verifies user is not an admin' do
      non_admin_user = build(:user, :non_admin)

      expect(non_admin_user.role).to eq('')
    end
  end
end
