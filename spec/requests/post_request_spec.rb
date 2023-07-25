require 'rails_helper'

RSpec.describe PostsController, type: :request do
  context 'GET /index' do
    it 'should return http success' do
      get '/users/1/posts/1'
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end

    it 'shold include correct placeholder' do
      get '/users/1/posts'
      expect(response.body).to include('List of Post')
    end
  end

  context 'GET /show' do
    it 'should return http success' do
      get '/users/1/posts/1'
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      get '/users/1/posts/1'
      expect(response.body).to include('Single post page')
    end
  end
end
