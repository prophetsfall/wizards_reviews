require 'rails_helper'
RSpec.describe WizardsController, type: :controller do
  let!(:user1) {FactoryBot.create(:user, role: "admin")}
  let!(:user2) {FactoryBot.create(:user, role: "member")}
  let!(:school) {MagicSchool.create(name: 'evocation')}
  let!(:clippy) { Wizard.create(
    name: "Clippy",
    description: "Unacceptably helpful word wizard",
    img_url: "www.clippy.com",
    creator_id: user2.id,
    magic_school: school
    )
  }
  let!(:clippy_review) {Review.create!(user_id: user2.id, wizard_id: clippy.id, body: "asdfjkl;", rating: 40 )}
  describe "DELETE#destroy" do
    it 'The creator of a wizard deletes the wizard' do
      sign_in :user, user2
      delete :destroy, params: { id: clippy.id }
      expect{Wizard.find(params:[:id])}.to raise_error
      expect{Review.find_by(wizard_id: params[:id])}.to raise_error
    end
  end
  describe "POST#create" do
    it "should add the wizard to the database" do
      sign_in :user, user1
      post :create, params: { wizard: { name: clippy.name, description: clippy.description, img_url: clippy.img_url, magic_school: school } }
      expect(Wizard.find(clippy.id).name).to eq 'Clippy'
    end
    it 'should not add wizard to db if user is not signed in' do
      post :create, params: { wizard: { name: 'derp', description: 'also derp', img_url: 'derp.url' } }
      expect{Wizard.find_by(name: 'derp').length}.to raise_error(NoMethodError)
    end
  end

  describe "PATCH#update" do
    it "should change the data in the db if creator is signed in" do
      sign_in :user, user2
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "Really he's not that bad once you get to know him", img_url: "www.clippy.com" } }
      expect(Wizard.find(clippy.id).name).to eq 'Clippy1'
    end

    it "should not update db if form is incomplete" do
      sign_in :user, user1
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "", img_url: "www.clippy.com" } }
      expect(Wizard.find(clippy.id).name).to eq 'Clippy'
    end

    it "should not update db if user is not logged in" do
      patch :update, params: { id: clippy.id, wizard: { name: "Clippy1", description: "Really he's not that bad once you get to know him", img_url: "www.clippy.com", creator_id: user1.id } }
      expect(Wizard.find(clippy.id).name).to eq 'Clippy'
    end
  end
end
