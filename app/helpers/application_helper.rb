module ApplicationHelper
  def set_heading(heading = '')
    base_heading = 'Small Blog'
    if heading.empty?
      base_heading
    else
      heading
    end
  end

  def set_subheading(sub_heading = '')
    base_subheading = 'A Small Rails Blog'
    if sub_heading.empty?
      base_subheading
    else
      sub_heading
    end
  end
  
  def set_image(image = '')
    base_image = 'http://loremflickr.com/1600/800'
    if image.empty?
      base_image
    else
      image
    end
  end
end