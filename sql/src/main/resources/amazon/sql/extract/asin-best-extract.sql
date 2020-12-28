-- noinspection SqlResolveForFile
-- noinspection SqlNoDataSourceInspectionForFile

-- set @url='https://www.amazon.com/Best-Sellers-Toys-Games/zgbs/toys-and-games';
select
    dom_base_uri(dom) as url,
    str_substring_between(dom_first_href(dom, 'span.zg-item a'), '/dp/', '/ref=') as `asin`,
    str_substring_between(dom_base_uri(dom), '.com/', '/ref=') as `category`,
    dom_first_integer(dom, 'span.zg-badge-text', 0) as `rank`,
    dom_first_text(dom, 'div > a > span.a-color-price') as `price`,
    dom_first_text(dom, 'span.zg-item a > div:expr(img=0 && char>30)') as title,
    dom_first_attr(dom, 'span.zg-item div img[src]', 'src') as `pic`,
    str_substring_between(dom_first_attr(dom, 'span.zg-item div a i.a-icon-star', 'class'), ' a-star-', ' ') as score,
    dom_first_text(dom, 'span.zg-item div a:has(i.a-icon-star) ~ a') as starnum
from load_and_select(@url, 'ol#zg-ordered-list > li.zg-item-immersion');
