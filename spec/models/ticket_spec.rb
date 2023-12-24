require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context "Validation in Title of Ticket" do
    it "Valid" do
      ticket = Ticket.new(title: "Title Test", description: "Test", status: "open")

      expect(ticket).to be_valid
    end

    it "Not valid" do
      ticket = Ticket.new(description: "Test", status: "open")

      expect(ticket).to_not be_valid
    end

    it 'e retorna que não pode ser em BRANCO blank' do
      ticket = Ticket.new(title: nil)
      post.valid?
      expect(post.errors[:title]).to include("não pode estar em branco.")
    end
  end

  # irb(main):002> ticket = Ticket.new(title: nil)
  # => #<Ticket _id: 658894c2a110884ce8d870b3, created_at: nil, updated_at: nil, title: nil, ...
  # irb(main):003> ticket.valid?
  # => false
  # irb(main):004> ticket.errors
  # => #<ActiveModel::Errors [#<ActiveModel::Error attribute=title, type=blank, options={}>, #<ActiveModel::Error attribute=description, type=blank, options={}>, #<ActiveModel::Error attribute=status, type=blank, options={}>]>
  # irb(main):005>

  context "Validation in Description of Ticket" do
    it "Valid" do
      ticket = Ticket.new(title: "Title Test of Description", description: "Test Description", status: "open")

      expect(ticket).to be_valid
    end

    it "Not valid" do
      ticket = Ticket.new(title: "Test not have Description", status: "open")

      expect(ticket).to_not be_valid
    end
  end
end
