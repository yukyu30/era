require 'rails_helper'

RSpec.describe 'Notes', type: :request do
  describe 'GET /index' do
    let!(:notes) { create_list(:note, 3) }

    before { get "/notes" }

    it 'ステータス200を返す' do
      expect(response).to have_http_status(:success)
    end

    it '正しい数のノートを返す' do
      json = JSON.parse(response.body)
      expect(json['notes'].length).to eq(3)
    end

    it '正しいノート属性を返す', :aggregate_failures do
      json = JSON.parse(response.body)
      json['notes'].each_with_index do |note_json, index|
        expect(note_json).to match({
          'title' => notes[index].title,
          'slug' => notes[index].slug,
          'eyecatch' => notes[index].eyecatch,
          'content' => notes[index].content,
          'published_at' => notes[index].published_at&.iso8601
        })
      end
    end
  end
end
