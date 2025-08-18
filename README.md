# A very simple conda env example

1. For maximal information (only guaranteed to be buildable on the same system & architecture):

`conda env export -f environment.yaml`

3. For all dependency versions specified (reproducible, but not portable for multiple OS's):

`conda env export -f --no-builds environment_no_builds.yaml`

5. For core, user-specified dependency list (*usually* portable for most systems, but not guaranteed to be reproducible):

`conda env export -f --no-builds --from-history environment_from_history.yaml`

7. For full dependency specification, portability, and reproducibility across multiple systems:
   
`conda env export -f --no-builds --from-history environment_from_history.yaml`
`conda-lock ...`

