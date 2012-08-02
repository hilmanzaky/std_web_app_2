module ApplicationHelper
  def iconed_text(name, icon, color = 'white')
    "<i class='#{icon} icon-#{color}'></i> #{name}".html_safe
  end

  def money_format(money)
    number_to_currency(money, :delimiter => '.', :unit => '', :precision => 0)
  end

  def number_format(number)
    number_with_precision(number, :strip_insignificant_zeros => true)
  end

  def terbilang(angka)
    satuan = [''] + %w{satu dua tiga empat lima enam tujuh delapan sembilan sepuluh sebelas}.collect{|x|x+' '}
    triple = [['puluh',10,20,100],['ratus',100,200,1000],['ribu',1000,2000,1000000],['juta',1000000,1000000,1000000000],['milyar',1000000000,1000000000,1000000000000]]
    hasil = satuan[angka] if angka<12
    hasil = terbilang(angka.divmod(10)[1]) + 'belas ' if angka>=12 and angka<20
    hasil = 'seratus '+terbilang(angka-100) if angka>=100 and angka<200
    hasil = 'seribu ' +terbilang(angka-1000) if angka>=1000 and angka<2000
    triple.each{|x|hasil = terbilang(angka.divmod(x[1])[0])+x[0]+' '+terbilang(angka.divmod(x[1])[1]) if angka>=x[2] and angka<x[3]}
    hasil
  end

  def date_format_id(date)
    bulan = [''] + %w{Januari Februari Maret April Mei Juni Juli Agustus September Oktober November Desember}
    "#{date.strftime("%d")} - #{bulan[date.strftime("%m").to_i]} - #{date.strftime("%Y")}"
  end

  def show(data)
    output = "<table class='table table-striped'>"
    data.each do |d|
      output << "<tr>"
      output << "<td><h6>" << d[0] << "</h6></td>"
      output << "<td>" << d[1].to_s << "</td>"
      output << "</tr>"
    end
    output << "</table>"
    return output
  end

  def nested_product_categories_nav(product_categories, first = true)
    id = ""
    if first == true
      id = "nav"
      first = false
    end
    content_tag(:ul, :class => "", :id => id) do
      product_categories.map do |product_category, sub_product_categories|
        #render(product_category) + content_tag(:div, sub_product_categories, :class => "nested_product_categories")
        content_tag(:li, :class => "") do
          (link_to(product_category.name.html_safe, product_category, "data-toggle" => "dropdown", :class => "dropdown-toggle") +
              nested_product_categories_nav(sub_product_categories, first))
        end
      end.join.html_safe
    end.html_safe unless product_categories.empty?
  end

  def nested_product_categories_options(product_categories, result = [])
    product_categories.map do |product_category, sub_product_categories|
      result << ["#{'-' * product_category.depth} #{product_category.name}", product_category.id]
      nested_product_categories_options(sub_product_categories, result)
    end
    result
  end
end
