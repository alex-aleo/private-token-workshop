program workshop_ofac.aleo;

mapping sanctioned:
    key as field.public;
    value as boolean.public;

function address_check:
    input r0 as address.private;
    hash.psd2 r0 into r1 as field;
    async address_check r1 into r2;
    output r2 as workshop_ofac.aleo/address_check.future;

finalize address_check:
    input r0 as field.public;
    get.or_use sanctioned[r0] false into r1;
    is.eq r1 false into r2;
    assert.eq r2 true;

function add_sanctioned_addresses:
    input r0 as address.private;
    is.eq self.signer aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0 into r1;
    assert.eq r1 true;
    hash.psd2 r0 into r2 as field;
    async add_sanctioned_addresses r2 into r3;
    output r3 as workshop_ofac.aleo/add_sanctioned_addresses.future;

finalize add_sanctioned_addresses:
    input r0 as field.public;
    set true into sanctioned[r0];

function remove_sanctioned_addresses:
    input r0 as address.private;
    is.eq self.signer aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0 into r1;
    assert.eq r1 true;
    hash.psd2 r0 into r2 as field;
    async remove_sanctioned_addresses r2 into r3;
    output r3 as workshop_ofac.aleo/remove_sanctioned_addresses.future;

finalize remove_sanctioned_addresses:
    input r0 as field.public;
    set false into sanctioned[r0];

constructor:
    assert.eq program_owner aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0;
