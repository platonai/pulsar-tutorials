package ai.platon.pulsar.tutorials

import ai.platon.pulsar.common.sql.ResultSetFormatter
import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.ql.h2.H2MemoryDb
import ai.platon.pulsar.tutorials.detail.SqlExtractor

class SqlManual: SqlExtractor() {
    private val conn = H2MemoryDb().getRandomConnection()
    private val statement = conn.createStatement()
    private val url = "https://list.jd.com/list.html?cat=652,12345,12349"

    /**
     * Load [url] if it's not in the database or it's expired, and then
     * scrape the fields in the page, all fields are restricted in a page section specified by restrictCss,
     * each field is specified by a css selector
     *
     * expire time: 1 day
     * restrict css selector: li[data-sku]
     * css selectors for fields: .p-name em, .p-price
     * */
    fun scrape() = execute("""
        select
            dom_first_text(dom, '.p-price') as price,
            dom_first_text(dom, '.p-name em') as name
        from
            load_and_select('$url -i 1d -ii 7d', 'li[data-sku]')"""
    )

    fun scrapeOutPages() = execute("""
        select
            dom_first_text(dom, '.p-price') as price,
            dom_first_text(dom, '.sku-name') as name
        from
            load_out_pages('$url -i 1d -ii 7d', 'a[href~=item]')"""
    )

    fun runAll() {
        scrape()
        scrapeOutPages()
    }
}

fun main() = withContext { SqlManual().runAll() }
