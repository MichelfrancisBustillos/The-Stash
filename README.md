# The Stash
Dotfiles, Scripts, docker-compose's, etc.

```mermaid
flowchart TD
    Start["Start Program"] --> CreateAuto1["Create auto1 with attributes: id=1451, make='Chevrolet', model='Camaro', color='red', year=2010, mpg=24.5"]
    CreateAuto1 --> CreateAuto2["Create auto2 with attributes: id=145188, make='Ford', model='Focus', color='white', year=2019, mpg=75"]
    CreateAuto2 --> DisplayAuto1["Display details of auto1"]
    DisplayAuto1 --> DisplayAuto2["Display details of auto2"]
    DisplayAuto2 --> InvalidID["Set invalid ID for auto1 (id=-3)"]
    InvalidID --> DisplayBadID["Display auto1 details (bad ID)"]
    DisplayBadID --> ValidID["Set valid ID for auto1 (id=2222)"]
    ValidID --> DisplayGoodID["Display auto1 details (good ID)"]
    DisplayGoodID --> ChangeMakeModel["Change make and model of auto1 (make='Toyota', model='Corolla')"]
    ChangeMakeModel --> DisplayMakeModel["Display auto1 details (changed make and model)"]
    DisplayMakeModel --> ChangeAuto2["Change attributes of auto2 (id=8686, color='blue', year=2016)"]
    ChangeAuto2 --> DisplayAuto2Changes["Display auto2 details (changed attributes)"]
    DisplayAuto2Changes --> InvalidMPG["Set invalid MPG for auto2 (mpg=4)"]
    InvalidMPG --> DisplayBadMPG["Display auto2 details (bad MPG)"]
    DisplayBadMPG --> ValidMPG["Set valid MPG for auto2 (mpg=30)"]
    ValidMPG --> DisplayGoodMPG["Display auto2 details (good MPG)"]
    DisplayGoodMPG --> End["End Program"]
