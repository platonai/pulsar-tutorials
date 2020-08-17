package ai.platon.pulsar.tutorials.sites

import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.common.Crawler

fun main() = withContext { Crawler(it).loadOutPages(
            "https://list.jd.com/list.html?cat=652,12345,12349", "-i 1s -ii 1s -ol a[href~=item]") }
