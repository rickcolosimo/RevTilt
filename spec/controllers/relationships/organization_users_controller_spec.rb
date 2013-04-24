require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Relationships::OrganizationUsersController do
  render_views
  
  # This should return the minimal set of attributes required to create a valid
  # Relationships::OrganizationUser. As you add validations to Relationships::OrganizationUser, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "organization_id" => "1", "user_id" => "2" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Relationships::OrganizationUsersController. Be sure to keep this updated too.
  # def valid_session
  #   {}
  # end
  
  before(:each) do
    @user = FactoryGirl.create(:user, :admin => true)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all relationships_organization_users as @relationships_organization_users" do
      organization_user = FactoryGirl.create(:relationships_organization_user)
      get :index, {}
      assigns(:relationships_organization_users).should eq([organization_user])
    end
  end

  describe "GET show" do
    it "assigns the requested relationships_organization_user as @relationships_organization_user" do
      organization_user = FactoryGirl.create(:relationships_organization_user)
      get :show, {:id => organization_user.to_param}
      assigns(:relationships_organization_user).should eq(organization_user)
    end
  end

  describe "GET new" do
    it "assigns a new relationships_organization_user as @relationships_organization_user" do
      get :new, {}
      assigns(:relationships_organization_user).should be_a_new(Relationships::OrganizationUser)
    end
  end

  describe "GET edit" do
    it "assigns the requested relationships_organization_user as @relationships_organization_user" do
      organization_user = FactoryGirl.create(:relationships_organization_user)
      get :edit, {:id => organization_user.to_param}
      assigns(:relationships_organization_user).should eq(organization_user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Relationships::OrganizationUser" do
        expect {
          post :create, {:relationships_organization_user => valid_attributes}
        }.to change(Relationships::OrganizationUser, :count).by(1)
      end

      it "assigns a newly created relationships_organization_user as @relationships_organization_user" do
        post :create, {:relationships_organization_user => valid_attributes}
        assigns(:relationships_organization_user).should be_a(Relationships::OrganizationUser)
        assigns(:relationships_organization_user).should be_persisted
      end

      it "redirects to the created relationships_organization_user" do
        post :create, {:relationships_organization_user => valid_attributes}
        response.should redirect_to(Relationships::OrganizationUser.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved relationships_organization_user as @relationships_organization_user" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relationships::OrganizationUser.any_instance.stub(:save).and_return(false)
        post :create, {:relationships_organization_user => { "organization_id" => "invalid value" }}
        assigns(:relationships_organization_user).should be_a_new(Relationships::OrganizationUser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Relationships::OrganizationUser.any_instance.stub(:save).and_return(false)
        post :create, {:relationships_organization_user => { "organization_id" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested relationships_organization_user" do
        organization_user = FactoryGirl.create(:relationships_organization_user)
        # Assuming there are no other relationships_organization_users in the database, this
        # specifies that the Relationships::OrganizationUser created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Relationships::OrganizationUser.any_instance.should_receive(:update_attributes).with({ "organization_id" => "1" })
        put :update, {:id => organization_user.to_param, :relationships_organization_user => { "organization_id" => "1" }}
      end

      it "assigns the requested relationships_organization_user as @relationships_organization_user" do
        organization_user = FactoryGirl.create(:relationships_organization_user)
        put :update, {:id => organization_user.to_param, :relationships_organization_user => valid_attributes}
        assigns(:relationships_organization_user).should eq(organization_user)
      end

      it "redirects to the relationships_organization_user" do
        organization_user = FactoryGirl.create(:relationships_organization_user)
        put :update, {:id => organization_user.to_param, :relationships_organization_user => valid_attributes}
        response.should redirect_to(organization_user)
      end
    end

    describe "with invalid params" do
      it "assigns the relationships_organization_user as @relationships_organization_user" do
        organization_user = FactoryGirl.create(:relationships_organization_user)
        # Trigger the behavior that occurs when invalid params are submitted
        Relationships::OrganizationUser.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization_user.to_param, :relationships_organization_user => { "organization_id" => "invalid value" }}
        assigns(:relationships_organization_user).should eq(organization_user)
      end

      it "re-renders the 'edit' template" do
        organization_user = FactoryGirl.create(:relationships_organization_user)
        # Trigger the behavior that occurs when invalid params are submitted
        Relationships::OrganizationUser.any_instance.stub(:save).and_return(false)
        put :update, {:id => organization_user.to_param, :relationships_organization_user => { "organization_id" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested relationships_organization_user" do
      organization_user = FactoryGirl.create(:relationships_organization_user)
      expect {
        delete :destroy, {:id => organization_user.to_param}
      }.to change(Relationships::OrganizationUser, :count).by(-1)
    end

    it "redirects to the relationships_organization_users list" do
      organization_user = FactoryGirl.create(:relationships_organization_user)
      delete :destroy, {:id => organization_user.to_param}
      response.should redirect_to(relationships_organization_users_url)
    end
  end
  
  describe "POST favorite" do
    before(:each) do
      @organization = FactoryGirl.create(:organization)
    end
    
    it "adds a relationships_organization_user" do
      expect {
        post :favorite, { :organization_id => @organization.to_param }
      }.to change(Relationships::OrganizationUser, :count).by(1)
    end
    
    it "should call favorite! on the user model" do
      User.any_instance.should_receive(:favorite!).with(@organization)
      post :favorite, { :organization_id => @organization.to_param }
    end
    
    it "should redirect to the organization" do
      post :favorite, { :organization_id => @organization.to_param }
      response.should redirect_to(@organization)
    end
    
    it "should be successful when given a js call" do
      post :favorite, { :organization_id => @organization.to_param, :format => :js }
      response.should be_successful
    end
  end
  
  describe "DELETE unfavorite" do
    before(:each) do
      @organization = FactoryGirl.create(:organization)
    end
    
    it "remove a relationships_organization_user" do
      @user.favorite!(@organization)
      expect {
        delete :unfavorite, { :organization_id => @organization.to_param }
      }.to change(Relationships::OrganizationUser, :count).by(-1)
    end
    
    it "should call favorite! on the user model" do
      User.any_instance.should_receive(:unfavorite!).with(@organization)
      delete :unfavorite, { :organization_id => @organization.to_param }
    end
    
    it "should redirect to the organization" do
      delete :unfavorite, { :organization_id => @organization.to_param }
      response.should redirect_to(@organization)
    end
    
    it "should be successful when given a js call" do
      delete :unfavorite, { :organization_id => @organization.to_param, :format => :js }
      response.should be_successful
    end
  end

end
