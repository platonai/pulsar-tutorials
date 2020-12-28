-- noinspection SqlResolveForFile
-- noinspection SqlNoDataSourceInspectionForFile

select
    -- the url of the page
    dombase_uri(dom) as `url`,
    -- the product title
    dom_first_text(dom, '#productTitle') as `title`,
    -- the category id
    str_substring_after(dom_first_href(dom, '#wayfinding-breadcrumbs_container ul li:last-child a'), '&node=') as `category`,
    -- the category path
    cast(dom_all_hrefs(dom, '#wayfinding-breadcrumbs_container ul li a') as varchar) as `categorypath`,
    -- the category name
    dom_first_text(dom, '#wayfinding-breadcrumbs_container ul li:last-child a') as `categoryname`,
    -- The category path
    array_join_to_string(dom_all_texts(dom, '#wayfinding-breadcrumbs_container ul li a'), '|') as `categorynamelevel`,
    -- the brand
    dom_first_slim_html(dom, '#bylineInfo') as `brand`,
    -- the gallery
    cast(dom_all_slim_htmls(dom, '#imageBlock img') as varchar) as `gallery`,
    -- the src of the main image
    dom_first_attr(dom, '#landingImage, #imgTagWrapperId img, #imageBlock img:expr(width>400)', 'data-old-hires') as `imgsrc`,
    -- the src of the main image
    dom_first_attr(dom, '#landingImage, #imgTagWrapperId img, #imageBlock img:expr(width>400)', 'data-a-dynamic-image') as `dynamicimgsrcs`,
    -- the html of the main image
    dom_first_slim_html(dom, '#landingImage, #imgTagWrapperId img, #imageBlock img:expr(width>400)') as `img`,
    -- the list price
    dom_first_text(dom, '#price tr td:contains(List Price) ~ td') as `listprice`,
    -- the price
    dom_first_text(dom, '#price tr td:matches(^Price) ~ td, #price_inside_buybox') as `price`,
    -- only for today
    dom_first_text(dom, '#price #priceblock_dealprice, #price tr td:contains(Deal of the Day) ~ td') as `withdeal`,
    -- how much you save
    dom_first_text(dom, '#price #dealprice_savings .priceBlockSavingsString, #price tr td:contains(You Save) ~ td') as `yousave`,
    -- the price in the right box, it should be the same with price
    dom_first_text(dom, '#price_inside_buybox') as `buyboxprice`,
    -- if this is a best seller product
    str_is_not_empty(dom_first_text(dom, '#acBadge_feature_div i:contains(Best Seller)')) as `isbs`,
    -- if this is a amazon choice product
    str_is_not_empty(dom_first_text(dom, '#acBadge_feature_div span:contains(Amazon)')) as `isac`,
    -- if a coupon is provided
    str_is_not_empty(dom_first_text(dom, '#centerCol #couponBadgeRegularVpc')) as `iscoupon`,
    -- if this is a prime product
    dom_first_text(dom, '#centerCol div i:contains(Prime Day Deal)') as `isprime`,

    -- the sellers
    cast(dom_all_texts(dom, 'a#sellerProfileTriggerId[href~=seller], #tabular-buybox tr:has(td:contains(Sold by)) td a[href~=seller], #usedbuyBox div:contains(Sold by) a[href~=seller], #merchant-info a[href~=seller], #buybox-tabular a[href~=seller]') as varchar) as `soldby`,
    -- the url of seller
    cast(dom_all_hrefs(dom, 'a#sellerProfileTriggerId[href~=seller], #tabular-buybox tr:has(td:contains(Sold by)) td a[href~=seller], #usedbuyBox div:contains(Sold by) a[href~=seller], #merchant-info a[href~=seller], #buybox-tabular a[href~=seller]') as varchar) as `sellerID`,
    -- the url of seller
    cast(dom_all_hrefs(dom, 'a#sellerProfileTriggerId[href~=seller], #tabular-buybox tr:has(td:contains(Sold by)) td a[href~=seller], #usedbuyBox div:contains(Sold by) a[href~=seller], #merchant-info a[href~=seller], #buybox-tabular a[href~=seller]') as varchar) as `marketplaceID`,
    -- where the product ships from
    cast(dom_all_texts(dom, '#desktop_buybox #merchant-info, #tabular-buybox tr:has(td:contains(Ships from)) td, #buybox-tabular tr:has(td:contains(Ships from)) td') as varchar) as `shipsfrom`,
    -- where the product is deliver to, extracted from the top-left of the page
    dom_first_text(dom, '#glow-ingress-block') as `globaldeliverto`,
    -- where the product is deliver to, extracted from the right panel of the page
    dom_first_text(dom, '#contextualIngressPtLabel_deliveryShortLine, #glowContextualIngressPt_feature_div, div[data-feature-name=glowContextualIngressPt]') as `deliverto`,

    -- stock information: in stock/out of stock/only xxx left in stock, etc
    dom_first_text(dom, '#availability, #outOfStock') as `instock`,
    -- how many want to buy
    dom_first_text(dom, '#selectQuantity select option:last-child') as `quantity`,
    -- the link to the other sellers
    cast(dom_all_hrefs(dom, '#availability a, #olp-upd-new-used a, #olp-upd-new a, #certified-refurbished-version a[href~=/dp/], #newer-version a[href~=/dp/]') as varchar) as `sellsameurl`,

    -- metadata of products bought together
    array_join_to_string(dom_all_attrs(dom, '#sims-fbt #sims-fbt-content ul li[data-p13n-asin-metadata]', 'data-p13n-asin-metadata'), '^|^') as `boughttogethermetadata`,
    -- images of products bought together
    array_join_to_string(dom_all_attrs(dom, '#sims-fbt #sims-fbt-content ul li[class~=sims-fbt-image] img', 'src'), '^|^') as `boughttogetherimgs`,
    -- names of products bought together
    array_join_to_string(dom_all_texts(dom, '#sims-fbt #sims-fbt-content ul li[data-p13n-asin-metadata]'), '^|^') as `boughttogether`,

    -- how many other sellers provide the same product
    str_substring_between(dom_first_text(dom, '#olp-upd-new-used a, #olp-upd-new a'), '(', ')') as `othersellernum`,
    -- is there is a Add to Cart button
    str_is_not_empty(dom_first_text(dom, '#addToCart_feature_div span:contains(Add to Cart), #submit.add-to-cart-ubb-announce')) as `isaddcart`,
    -- is there is a Buy Now button
    str_is_not_empty(dom_first_text(dom, '#buyNow span:contains(Buy now)')) as `isbuy`,
    -- the feature bullets
    cast(dom_all_slim_htmls(dom, '#feature-bullets ul li') as varchar) as `featurebullets`,
    -- the product description
    dom_first_text(dom, '#productDescription, h2:contains(Product Description) + div') as `desc`,

    -- the feedback url
    cast(dom_all_slim_htmls(dom, '#prodDetails h1:contains(Feedback) ~ div a') as varchar) as `feedbackurl`,
    -- the asin of this product
    dom_first_text(dom, '#prodDetails table tr > th:contains(ASIN) ~ td, #detailBullets_feature_div ul li span:contains(ASIN) ~ span') as `asin`,
    -- the parent asin of this product
    dom_first_text(dom_owner_body(dom), '#pulsarJsVariables pre.parentAsin') as `pasin`,

    -- how many variations(different color, size, etc)
    dom_first_text(dom_owner_body(dom), '#pulsarJsVariables pre.num_total_variations') as `totalvariations`,
    -- several variables extracted from javascript source code
    dom_first_text(dom_owner_body(dom), '#pulsarJsVariables pre.jsVariables') as `jsVariables`,

    -- the volume(dimensions) of the product
    dom_first_text(dom, '#prodDetails table tr > th:contains(Product Dimensions) ~ td, #detailBullets_feature_div ul li span:contains(Package Dimensions) ~ span') as `volume`,
    -- the weight of the product
    dom_first_text(dom, '#prodDetails table tr > th:contains(Item Weight) ~ td') as `weight`,
    -- the html of the rank section
    dom_outer_html(dom_select_first(dom, '#prodDetails table tr > th:contains(Best Sellers Rank) ~ td, #detailBullets_feature_div ul li span:contains(Best Sellers Rank)')) as `rank`,
    -- the text of the rank section
    dom_first_text(dom, '#detailBullets_feature_div ul li span:contains(Best Sellers Rank)') as `rank2`,
    -- on sale time
    dom_first_text(dom, '#prodDetails table tr > th:contains(Date First) ~ td, #detailBullets_feature_div ul li span:contains(Date First Available) ~ span') as `onsaletime`,
    -- the urls of images in the description
    cast(dom_all_attrs(dom, '#prodDetails img[src], #productDescription img[src], #dpx-aplus-product-description_feature_div img[src], #dpx-aplus-3p-product-description_feature_div img[src]', 'src') as varchar) as `detailimgs`,
    -- the urls of detail videos
    cast(dom_all_hrefs(dom, '#rvs-vse-related-videos ol li a[href~=/vdp/]') as varchar) as `detailvideos`,
    -- if there are images in the description
    array_length(dom_all_imgs(dom, '#prodDetails img[src], #productDescription img[src]')) as `isa`,
    -- the number of questions
    str_first_integer(dom_first_text(dom, '#askATFLink, .askTopQandALoadMoreQuestions a'), 0) as `qanum`,
    -- the number of reviews
    str_first_integer(dom_first_text(dom, '#reviewsMedley span:contains(customer ratings)'), 0) as `reviews`,

    -- reviews mention
    cast(dom_all_texts(dom, '#reviewsMedley div[data-hook=lighthut-terms-list] a, #reviewsMedley h3:contains(Read reviews that mention) ~ div a') as varchar) as `reviewsmention`,
    -- the score
    str_first_float(dom_first_text(dom, '#reviewsMedley .AverageCustomerReviews span:contains(out of)'), 0.0) as `score`,
    -- the number of stars
    str_first_integer(dom_first_text(dom, '#reviewsMedley div[data-hook=total-review-count], #acrCustomerReviewText'), 0) as `starnum`,
    dom_first_text(dom, 'table#histogramTable:expr(width > 100) td:contains(5 star) ~ td:contains(%)') as `score5percent`,
    dom_first_text(dom, 'table#histogramTable:expr(width > 100) td:contains(4 star) ~ td:contains(%)') as `score4percent`,
    dom_first_text(dom, 'table#histogramTable:expr(width > 100) td:contains(3 star) ~ td:contains(%)') as `score3percent`,
    dom_first_text(dom, 'table#histogramTable:expr(width > 100) td:contains(2 star) ~ td:contains(%)') as `score2percent`,
    dom_first_text(dom, 'table#histogramTable:expr(width > 100) td:contains(1 star) ~ td:contains(%)') as `score1percent`,
    -- scores by feature
    dom_all_texts(dom, 'div#cr-dp-summarization-attributes div[data-hook=cr-summarization-attribute]') as `scoresbyfeature`,
    -- the url of reviews
    dom_first_href(dom, '#reviews-medley-footer a') as `reviewsurl`,

    -- the url of page from which this page is lead to
    dom_attr(dom_select_first(dom, '#PulsarMetaInformation'), 'referer') as `referer`,
    format_timestamp(dom_attr(dom_select_first(dom, '#PulsarMetaInformation'), 'timestamp'), 'yyyy-MM-dd HH:mm:ss') as `task_time`,

    -- the total number of chars in this page
    dom_ch(dom) as `numchars`,
    -- the total number of links in this page
    dom_a(dom) as `numlinks`,
    -- the total number of images in this page
    dom_img(dom) as `numimgs`,
    -- the height of this page
    dom_height(dom) as `height`
from load_and_select(@url, ':root body');
