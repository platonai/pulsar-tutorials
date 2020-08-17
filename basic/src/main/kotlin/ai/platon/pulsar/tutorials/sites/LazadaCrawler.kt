package ai.platon.pulsar.tutorials.sites

import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.common.Crawler

private const val portalUrl = "https://www.lazada.com.my/shop-pressure-cookers/"
private val args = """
        -i 1s -ii 1s -ol ".product-recommend-items__item-wrapper > a" -query .product-briefing
    """.trimIndent()

fun main() = withContext { Crawler(it).loadOutPages(portalUrl, args) }
