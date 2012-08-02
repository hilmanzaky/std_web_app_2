module ProductCategoriesHelper
#  def nested_product_categories(product_categories)
#    product_categories.map do |pc, sub_pcs|
#      render(pc) + content_tag(:div, nested_product_categories(sub_pcs), :class => "nested_product_categories")
#    end.join.html_safe
#  end

  def nested_product_categories_table(product_categories, level = 0)
    product_categories.map do |pc, sub_pcs|
      render(pc, :level => level) + nested_product_categories_table(sub_pcs, level + 1)
#      render(pc) + (" " * level) + nested_product_categories_table(sub_pcs,level + 1)
    end.join.html_safe
  end
end