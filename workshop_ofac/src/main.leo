// The 'ofac' program.
program workshop_ofac.aleo {
    mapping sanctioned: field => bool;

    @admin(address="aleo16ee2zncu2t6ftcpnnnmyd3c6pf8eu2xfyksh23amwqgvapp6mg8q8hy7e0")
    async constructor() {}
    
    async transition address_check (private addr : address) -> Future{
        let addr_hash : field = Poseidon2::hash_to_field(addr);
        let f : Future = async {
            sanctioned.get_or_use(addr_hash,false);
        };
        return f;
    }
}
