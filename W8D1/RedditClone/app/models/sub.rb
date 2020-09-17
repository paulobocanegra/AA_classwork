# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    belongs_to :moderator,
     primary_key: :id,
     foreign_key: :moderator_id,
     class_name: :User

     has_many :posts,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Post

     has_many :post_subs,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :PostSub
    
    # has_many :posts

    #Let me zip this and send it to you :)
end
