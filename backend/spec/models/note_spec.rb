require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validation' do
    let!(:note) {build(:note)}

    context '全ての属性が正しい場合' do
      it 'バリデーションが通過する' do
        expect(note).to be_valid
      end
    end

    describe 'title' do
      context 'nilの時' do
        it 'バリデーションエラーが発生する' do
          note.title = nil
          expect(note).to be_invalid
        end
      end
      context 'blankの時' do
        it 'バリデーションエラーが発生する' do
          note.title = ''
          expect(note).to be_invalid
        end
      end
    end

    describe 'slug' do
      context 'nilの時' do
        it 'バリデーションエラーが発生する' do
          note.slug = nil
          expect(note).to be_invalid
        end
      end
      context 'blankの時' do
        it 'バリデーションエラーが発生する' do
          note.slug = ''
          expect(note).to be_invalid
        end
      end
      context '重複したslugが存在する時' do
        it 'バリデーションエラーが発生する' do
          create(:note, slug: 'duplicate-slug')
          note.slug = 'duplicate-slug'
          expect(note).to be_invalid
        end
      end
    end

    describe 'content' do
      context 'nilの時' do
        it 'バリデーションエラーが発生する' do
          note.content = nil
          expect(note).to be_invalid
        end
      end
      context 'blankの時' do
        it 'バリデーションエラーが発生する' do
          note.content = ''
          expect(note).to be_invalid
        end
      end
    end

    describe 'eyecatch' do
      context 'nilの時' do
        it 'バリデーションエラーが発生しない' do
          note.eyecatch = nil
          expect(note).to be_valid
        end
      end
      context 'blankの時' do
        it 'バリデーションエラーが発生しない' do
          note.eyecatch = ''
          expect(note).to be_valid
        end
      end
    end

    describe 'published_at' do
      context 'nilの時' do
        it 'バリデーションエラーが発生しない' do
          note.published_at = nil
          expect(note).to be_valid
        end
      end
      context 'blankの時' do
        it 'バリデーションエラーが発生しない' do
          note.published_at = ''
          expect(note).to be_valid
        end
      end
    end
  end
  

end
