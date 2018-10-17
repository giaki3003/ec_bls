#BLS lib.
import ../BLS

#Seeds.
var
    seed1: string = "1"
    seed2: string = "2"

#Private Keys.
var
    #From seed.
    privKey1: PrivateKey = newPrivateKeyFromSeed(seed1)
    #From bytes.
    privKey2: PrivateKey = newPrivateKeyFromBytes(privKey1.toString())
    #From hex.
    privKey3: PrivateKey = newPrivateKeyFromBytes($privKey1)
    #From a different seed.
    privKey4: PrivateKey = newPrivateKeyFromSeed(seed2)

#Make sure the first 3 keys are the same.
assert(privKey1 == privKey2)
assert(privKey2 == privKey3)

#Make sure the one from the different seed is diffieerent.
assert(privKey3 != privKey4)

#Assign #4 to #3.
privKey4 = privKey3
#Check their values.
assert(privKey3 == privKey4)
#Make sure it didn't just copy the ref value but the actual value.
assert(cast[int](privKey3.data) != cast[int](privKey4.data))
