module SpendsHelper
  def to_tags_links_listing(tags)
    links_listing = ""
    tags.each do |tag|
       links_listing << link_to(tag, :with_tag => tag.name) + TagsHelper::DELIMITER
    end
    links_listing.chomp!(TagsHelper::DELIMITER)
  end
end
