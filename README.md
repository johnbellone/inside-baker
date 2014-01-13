# Vagrant boxes

        $ bundle install --binstubs
        $ rake setup packer:template
        $ packer build -only=virtualbox -var-file=tmp/variables.json packer-template.json
