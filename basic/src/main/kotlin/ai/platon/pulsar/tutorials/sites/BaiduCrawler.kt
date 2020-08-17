package ai.platon.pulsar.tutorials.sites

import ai.platon.pulsar.common.config.CapabilityTypes
import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.common.Crawler

fun main() {
    System.setProperty(CapabilityTypes.BROWSER_DRIVER_HEADLESS, "false")
    val portalUrl = "https://www.baidu.com/"

    withContext {
        Crawler(it).load(portalUrl, "-i 1s")
    }
}
