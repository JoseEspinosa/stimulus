
process STIMULUS_NOISE_CSV {

    container 'alessiovignoli3/stimulus:stimulus_noise'

    input:
    tuple path(csv), val(user_json), path(parsed_json)

    output:
    tuple val("${csv}"), val("${user_json}"), path(output), emit: noised_data
    stdout emit: standardout

    script:
    output = "${csv.baseName}-${parsed_json.baseName}.csv"
    """
    launch_split_csv.py -c ${csv} -j ${parsed_json} -o ${output}
    """
}
