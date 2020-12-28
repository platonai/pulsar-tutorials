package ai.platon.pulsar.tutorials.amazon

import ai.platon.pulsar.common.sql.SqlTemplate
import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.detail.SqlExtractor

fun main() = withContext {
    val url = "https://www.amazon.com/Wyze-Indoor-Wireless-Detection-Assistant/dp/B076H3SRXG"
    val executor = SqlExtractor()
    val sql = SqlTemplate.load("amazon/sql/crawl/x-asin.sql").createInstance(url)
    executor.execute(sql)
}
