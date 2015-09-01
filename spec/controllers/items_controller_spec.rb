require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before do
    user = User.create(email: "user@example.com", password: "password")
    authentication_token = AuthenticationToken.create(user_id: user.id,
                                                      body: "token",
                                                      last_used_at: DateTime.current)
    request.env["HTTP_X_USER_EMAIL"] = user.email
    request.env["HTTP_X_AUTH_TOKEN"] = authentication_token.body
  end

# it_behaves_like "api_controller"
# it_behaves_like "authenticated_api_controller"

  let!(:list) { List.create(title: "New List title") }

  let(:valid_item_attributes) {
    { title: "Some Item Title", complete: false }
  }

  let(:invalid_item_attributes) {
    { title: nil }
  }

  let!(:item) { list.items.create(valid_item_attributes) }

  describe "GET #index" do
    it "does NOT route to GET index" do
      expect(:get => "posts/1").not_to be_routable
    end
  end

  describe "GET #show" do
    it "assigns the requested item as @item" do
      get :show, { id: item.id, list_id: list.id, format: :json }

      expect(assigns(:item)).to eq(item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new item" do
        expect {
          post :create, { list_id: list.id, item: valid_item_attributes, format: :json  }
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, { list_id: list.id, item: valid_item_attributes, format: :json  }

        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end
    end # "with valid params"

    context "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        post :create, { list_id: list.id, item: invalid_item_attributes, format: :json  }

        expect(assigns(:item)).to be_a_new(Item)
      end

      it "returns unprocessable_entity status" do
        put :create, { list_id: list.id, item: invalid_item_attributes, format: :json }

        expect(response.status).to eq(422)
      end
    end # "with invalid params"
  end # "POST #create"

  describe "PUT #update" do
    context "with valid params" do
      let(:new_item_attributes) {
        { title: "updated title" }
      }

      it "updates the requested item" do
        put :update, { id: item.id, list_id: list.id, item: new_item_attributes, format: :json  }
        item.reload
        expect(item.title).to eq("updated title")
      end

      it "assigns the requested item as @item" do
        put :update, { id: item.id, list_id: list.id, item: valid_item_attributes, format: :json  }
        expect(assigns(:item)).to eq(item)
      end
    end

    context "with invalid params" do
      it "assigns the item as @item" do
        put :update, { id: item.id, list_id: list.id, item: invalid_item_attributes, format: :json  }
        expect(assigns(:item)).to eq(item)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: item.id, list_id: list.id, item: invalid_item_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      expect {
        delete :destroy, { id: item.id, list_id: list.id, format: :json  }
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      delete :destroy, { id: item.id, list_id: list.id, format: :json  }
      # 204 -> success but is returning no content.
      # The controller returns `head :no_content`
      expect(response.status).to eq(204)
    end
  end

end
