require 'rails_helper'

RSpec.describe Diary, type: :model do
  let(:diary) { described_class.new(title: title) }
  let(:title) { 'タイトル' }

  describe '#valid?' do
    subject { diary.valid? }

    context 'タイトルが入っている場合' do
      it { is_expected.to be_truthy }
    end
  end
end
