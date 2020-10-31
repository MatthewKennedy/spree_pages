class Spree::Page < Spree::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  has_and_belongs_to_many :stores

  before_save :create_slug

  validates :title, presence: true

  if Spree::Config[:blogs_use_action_text]
    has_rich_text :action_text_content
    validates :action_text_content, presence: true
  else
    validates :content, presence: true
  end

  default_scope { order('created_at DESC') }
  scope :visible, -> { where visible: true }
  scope :by_store, ->(store) { joins(:stores).where('spree_pages_stores.store_id = ?', store) }

  def page_content
    if Spree::Config[:blogs_use_action_text]
      action_text_content
    else
      content
    end
  end

  def page_seo_title
    if meta_title.present?
      meta_title
    else
      title
    end
  end

  private

  def create_slug
    self.slug = if slug.blank?
                  title.to_url
                else
                  slug.to_url
                end
  end
end
