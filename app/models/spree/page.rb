class Spree::Page < Spree::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]

  before_save :create_slug

  validates :title, presence: true

  if Spree::Config[:blogs_use_action_text]
    has_rich_text :action_text_content
    validates :action_text_content, presence: true
  else
    validates :content, presence: true
  end

  scope :visible, -> { where visible: true }

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
