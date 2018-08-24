require 'rails_helper'

describe StarredRepository do
  it 'find starred repositories data' do
    data = {
            id: 12,
            node_id: "MDE",
            name: "idea-box"
            }

    starred_repository = StarredRepository.new(data)

    expect(starred_repository.id).to eq(12)
    expect(starred_repository.name).to eq('idea-box')
  end
end
