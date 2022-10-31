# typed: strict

module PostsHelper
  def form_image_select(post)
    if post.image.exists?
      return image_tag(post.image.url(:medium), id: 'image-preview',
                                                class: 'img-responsive image')
    end

    image_tag('placeholder.jpg', id: 'image-preview', class: 'img-responsive image')
  end
end
