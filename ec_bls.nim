#Make sure C++ is the backend.
when not defined(cpp):
    {.fatal: "The BLS lib requires C++.".}

#Include the BLS headers.
const currentFolder = currentSourcePath().substr(0, currentSourcePath().len - 11)
{.passC: "--std=c++11".}
{.passC: "-I" & currentFolder & "Chia/src/".}
{.passC: "-I" & currentFolder & "Chia/contrib/relic/include".}
{.passC: "-I" & currentFolder & "Chia/build/contrib/relic/include".}

#Link against BLS.
{.passL: "-lbls".}

#Init BLS.
proc init(): bool {.header: "bls.hpp", importcpp: "bls::BLS::Init".}
if not init():
    raise newException(Exception, "Couldn't init the BLS lib.")

#Import each of the BLS files.
import ec_bls/Objects
import ec_bls/PrivateKey
import ec_bls/PublicKey
import ec_bls/Signature
import ec_bls/AggregationInfo

#Export the public objects and tbe sublibraries.
export Objects.PrivateKey, Objects.PublicKey
export Objects.Signature, Objects.AggregationInfo
export PrivateKey, PublicKey, Signature, AggregationInfo
