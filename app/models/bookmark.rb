require 'elasticsearch/model'

class Bookmark < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  default_scope { order('created_at DESC') }

def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['title^10', 'text']
        }
      },
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          title: {},
          text: {}
        }
      }
    }
  )
end




# Delete the previous articles index in Elasticsearch
Bookmark.__elasticsearch__.client.indices.delete index: Bookmark.index_name rescue nil
 
# Create the new index with the new mapping
Bookmark.__elasticsearch__.client.indices.create \
  index: Bookmark.index_name,
  body: { settings: Bookmark.settings.to_hash, mappings: Bookmark.mappings.to_hash }
end 
# Index all article records from the DB to Elasticsearch
Bookmark.import