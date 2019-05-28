require 'rails_helper'

describe ProductsController do
	describe "POST create" do
		context 'when a product is successfully created' do
			let(:params) do
				{
					product: {
						name: 'Meu produto', desc: 'Meu produto muito bonito',
						id_department: @department.id, price: 32, amount: 6869
					}
				}
			end

			before(:each) do
				@department = Department.create(name: 'Novo')
			end

			it "sets flash notice" do
				post :create, params: params
				expect(flash[:notice]).to eq("Produto criado com sucesso!")
			end

			it "redirects to root_url" do
				post :create, params: params
				expect(response).to redirect_to(root_url)
			end
		end
	end
end