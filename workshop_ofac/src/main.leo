// The 'ofac' program.
program workshop_ofac.aleo {
    mapping sanctioned: field => bool;
    const ADMIN : address = aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0;

    @admin(address="aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0")
    async constructor() {}
    
    async transition address_check (private addr : address) -> Future{
        let addr_hash : field = Poseidon2::hash_to_field(addr);
        let f : Future = async {
            let check : bool = sanctioned.get_or_use(addr_hash,false);
            assert(check == false);
        };
        return f;
    }

    async transition add_sanctioned_addresses (addr : address) -> Future{
        assert(self.signer == ADMIN);

        let addr_hash : field = Poseidon2::hash_to_field(addr);
        let f : Future = async {
            sanctioned.set(addr_hash,true);
        };
        return f;
    }

    async transition remove_sanctioned_addresses (addr : address) -> Future{
        assert(self.signer == ADMIN);

        let addr_hash : field = Poseidon2::hash_to_field(addr);
        let f : Future = async {
            sanctioned.set(addr_hash,false);
        };
        return f;
    }
}
