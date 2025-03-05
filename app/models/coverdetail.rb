class Coverdetail < ApplicationRecord
        belongs_to :cover, foreign_key: "cover_id"
end
