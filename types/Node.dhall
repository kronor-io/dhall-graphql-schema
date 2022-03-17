let TypeData = ./TypeData.dhall

let InputData = ./InputData.dhall

let Enum = ./Enum.dhall

let Union = ./Union.dhall

in  < type : TypeData | union : Union | enum : Enum | input : InputData >
