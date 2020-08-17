package ai.platon.pulsar.tutorials.sites

import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.common.Crawler

private const val portalUrl = "https://shopee.co.th/กระเป๋าเป้ผู้ชาย-cat.49.1037.10297?page=1"

private val args = """
        -i 1s -ii 1s -ol ".shopee-search-item-result__item a" -query .product-briefing -sc 10
    """.trimIndent()

fun main() = withContext { Crawler(it).loadOutPages(portalUrl, args) }
