require 'rails_helper'

RSpec.describe List, type: :model do

  describe "db structure" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

end
