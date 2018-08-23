require 'rails_helper'

describe Repository do
  it 'find repositories data' do
      data = {
              id: 141,
              node_id: "MDE",
              name: "1804"
              }

      repository = Repository.new(data)

      expect(repository.name).to eq('1804')
      expect(repository.id).to eq(141)
  end
end
