program ofac.aleo;

mapping sanctioned:
    key as field.public;
    value as boolean.public;

function address_check:
    input r0 as address.private;
    hash.psd2 r0 into r1 as field;
    async address_check r1 into r2;
    output r2 as ofac.aleo/address_check.future;

finalize address_check:
    input r0 as field.public;
    get.or_use sanctioned[r0] false into r1;

constructor:
    assert.eq edition 0u16;
