package ai.platon.pulsar.tutorials.advanced

import ai.platon.pulsar.context.withContext
import ai.platon.pulsar.tutorials.Manual

fun main() = withContext("classpath:pulsar-beans/app-context.xml") {
    System.setProperty("use_proxy", "no")
    Manual(it.createSession()).runAll()
}
