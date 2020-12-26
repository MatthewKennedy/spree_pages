module SpreePages
  class Configuration < Spree::Preferences::Configuration
    preference :use_action_text, :boolean, default: false
    preference :use_raw_body_text, :boolean, default: false
  end
end
