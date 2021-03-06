shared_context "controller_spec" do
  render_views
  let(:get_index) { get :index }
  let(:get_show) { get :show, show_params }
  let(:post_create) { post :create, create_params }
  let(:put_update) { put :update, update_params }
  let(:delete_destroy) { delete :destroy, destroy_params }
end

shared_context "with_current_user" do
  before { controller.stub(:current_user) { current_user } }
end

shared_context "with_ability" do

  before do
    controller.stub(:current_ability).and_return(ability)
    ability.can :manage, :all
  end

  let(:ability) { Object.new.extend(CanCan::Ability) }
end

shared_examples "create_access_forbidden" do
  before { post_create }
  it { expect(response).to redirect_to :root }
end

shared_examples "show_access_forbidden" do
  before { get_show }
  it { expect(response).to redirect_to :root }
end

shared_examples "update_access_forbidden" do
  before { put_update }
  it { expect(response).to redirect_to :root }
end

shared_examples "destroy_access_forbidden" do
  before { delete_destroy }
  it { expect(response).to redirect_to :root }
end

