// The 'ofac' program.
program workshop_ofac.aleo {
    mapping sanctioned: field => bool;

    @noupgrade
    async constructor() {}
    
    async transition address_check (private addr : address) -> Future{
        let addr_hash : field = Poseidon2::hash_to_field(addr);
        let f : Future = async {
            sanctioned.get_or_use(addr_hash,false);
        };
        return f;
    }
}
