class WombatService
  def self.run
    Wombat.crawl do
      # base_url "https://bibomart.com.vn/sua-bot-cac-loai-c178"
      base_url "https://bibomart.com.vn/112920-p46935.html"
      path "/"
      img 'css=.etalage_source_image/@src', :list
      name css: 'h1[itemprop="name"]'
      sku css: 'span[itemprop="sku"]/@content'
      price css: 'span[itemprop="price"]/@content'
      attributes 'css=.attribute-info>li', :list
      detail_attributes 'css=.specTable tr', :iterator do
        name css: 'td.specsKey'
        value css: 'td.specsValue'
      end
      brand css: 'span.brand-name a[itemprop="brand"]'
      detail css: '.detail_content'

      # img css: '.product-item #listThumb div a img/@src'
      # link css: 'ul.cat_childs li a/@href'
      # categories 'css=ul.cat_childs>li', :iterator do
      #   name 'css=a', :html
      #   link 'css=a', :follow do
      #     product 'css=.product_title', :iterator do
      #       link 'css=a', :follow do
      #         images 'css=.etalage_source_image/@src', :list
      #       end
      #     end
      #   end
      # end
    end
  end
end
