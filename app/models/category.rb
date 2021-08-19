class Category < ApplicationRecord
    has_many :communities
    has_ancestry
end
