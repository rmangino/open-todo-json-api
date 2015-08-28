require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  it_behaves_like "api_controller"

  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to adjust the attributes here as well.
  let(:valid_attributes) {
    { title: "Some List Title" }
  }

  let(:invalid_attributes) {
    { title: nil }
  }

  let!(:list) { List.create(valid_attributes) }

  describe "GET #index" do
    it "assigns all lists as @lists" do
      get :index, { format: :json }
      expect(assigns(:lists)).to eq([list])
    end
  end

  describe "GET #show" do
    it "assigns the requested list as @list" do
      get :show, { id: list.id, format: :json }
      expect(assigns(:list)).to eq(list)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new List" do
        expect {
          post :create, { list: valid_attributes, format: :json  }
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, { list: valid_attributes, format: :json  }
        expect(assigns(:list)).to be_a(List)
        expect(assigns(:list)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved list as @List" do
        post :create, { list: invalid_attributes, format: :json  }
        expect(assigns(:list)).to be_a_new(List)
      end

      it "returns unprocessable_entity status" do
        put :create, { list: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "updated title" }
      }

      it "updates the requested list" do
        put :update, { id: list.id, list: new_attributes, format: :json  }
        list.reload
        expect(list.title).to eq("updated title")
      end

      it "assigns the requested list as @list" do
        put :update, { id: list.id, list: valid_attributes, format: :json  }
        expect(assigns(:list)).to eq(list)
      end
    end

    context "with invalid params" do
      it "assigns the list as @list" do
        put :update, { id: list.id, list: invalid_attributes, format: :json  }
        expect(assigns(:list)).to eq(list)
      end

      it "returns unprocessable_entity status" do
        put :update, { id: list.id, list: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list" do
      expect {
        delete :destroy, { id: list.id, format: :json  }
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      delete :destroy, { id: list.id, format: :json  }
      # 204 -> success but is returning no content.
      # The controller returns `head :no_content`
      expect(response.status).to eq(204)
    end
  end

end
