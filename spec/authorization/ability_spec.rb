require 'spec_helper'
require "cancan/matchers"

describe Ability do
  describe "admin" do
    before(:each) do
      @user = FactoryGirl.create(:user, :admin => true)
      @ability = Ability.new(@user)
    end
    
    subject { @ability }
    it { should be_able_to(:manage, :all) }
  end
  
  describe "Reviews" do
    describe "guest" do
      before(:each) do
        @ability = Ability.new
      end
      subject { @ability }
      
      it { should be_able_to(:show, FactoryGirl.build(:review)) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:review)) }
    end
    
    describe "signed in user" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @ability = Ability.new(@user)
      end
      subject { @ability }
      
      it { should be_able_to(:show, FactoryGirl.build(:review)) }
      it { should be_able_to(:manage, FactoryGirl.build(:review, :user => @user)) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:review, :user_id => @user.id - 1)) }
    end
  end
  
  describe "Organizations" do
    describe "guest" do
      before(:each) do
        @ability = Ability.new
      end
      subject { @ability }
      
      it { should be_able_to(:show, FactoryGirl.build(:organization)) }
      it { should_not be_able_to(:create, Organization) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:organization)) }
    end
    
    describe "signed in user" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @ability = Ability.new(@user)
      end
      subject { @ability }
      
      it { should be_able_to(:show, FactoryGirl.build(:organization)) }
      it { should be_able_to(:create, FactoryGirl.build(:organization)) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:organization)) }
    end
  end
  
  describe "Relationships::OrganizationUser" do
    describe "signed in user" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @ability = Ability.new(@user)
      end
      subject { @ability }
      
      it { should_not be_able_to(:update, FactoryGirl.build(:relationships_organization_user)) }
      it { should_not be_able_to(:show, FactoryGirl.build(:relationships_organization_user)) }
      it { should_not be_able_to(:manage, FactoryGirl.build(:relationships_organization_user)) }
    end
  end
end