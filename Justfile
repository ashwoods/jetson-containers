# This is not the droid you are looking for...

# build a production build
build target:
    kas build kas.yml --target {{target}}

devshell target:
    kas shell kas.yml -c "bitbake {{target}} -c devshell"

# Output all repo git sha
spec:
    kas for-all-repos kas.yml 'git rev-parse HEAD' 

# list all images
ls-images:
    kas for-all-repos kas.yml 'ls meta*/recipes*/images/*.bb || true' 

ls-recipes:
    kas shell kas.yml -c "bitbake -s"

# show all layers
show-layers:
    kas shell kas.yml -c "bitbake-layers show-layers"


# list tasks for a package
listtasks package:
    kas shell kas.yml -c "bitbake -c listtasks {{package}}"

# execute a task for a pacakge
execute task package:
    kas shell kas.yml -c "bitbake -c {{task}} {{package}}"

# clean duplicates sstate

clean-sstate:
    poky/scripts/sstate-cache-management.sh --remove-duplicated -d --cache-dir=build/sstate-cache
