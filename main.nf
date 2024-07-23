nextflow.enable.dsl=2

// Subworkflows
include { copy } from "./target/nextflow/utils/copy/main.nf"

workflow {
    main:
        ch_input = Channel.value([
            "id",
            [
                input: "input.txt",
            ]
        ])

        ch_input
        | copy.run(
            toState: ["foo": "output"]
        )
        // | copy
        | view
}