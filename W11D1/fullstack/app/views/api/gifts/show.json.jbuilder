# json.partial! '../guests/gifts/', :title, :description

json.extract! @gift, :title, :description
# json.partial! 'posts/post', collection: @posts, as: :post

# json.partial! "gift" , gift: @gift