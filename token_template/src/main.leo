import workshop_ofac.aleo;

/*
====================================================================================================================
TASK 0: Name Your Token

TODO: 
    1. Choose what your token program will be named! This should be longer than 10 characters to avoid additional
       network fees and not conflict with any existing program on the network
        - ex) `dogecoin_token.aleo`
    2. Change the name of the program below
        - ex) `program dogecoin_token.aleo {`
    3. Change the "program" field in the program.json file to match the name of your new program

====================================================================================================================  
*/
program token.aleo {
    mapping balances: address => u64;  // On-chain mapping between user addresses and public token balances

    record Token {
        owner: address,  // The token owner
        amount: u64,     // The token amount
    }

    @noupgrade
    async constructor() {}





    /*
    ====================================================================================================================
    TASK 1: Mint (Public)

    This feature mints new tokens by updating the public mapping value of the recipient
    
    TODO:
        `mint_public`:
            1. Query the `address_check` function in `workshop_ofac.aleo` with the `recipient` field
            2. Pass the returned Future and other appropriate fields to the `mint_public_onchain` function

        `mint_public_onchain`:
            1. Await the `address_check` Future
            2. Set the value for `recipient` in the `balances` mapping to the current value plus `amount` 

    
    ====================================================================================================================  
    */
    async transition mint_public(
        public recipient: address, 
        public amount: u64
    ) -> Future {
        let address_check : Future = workshop_ofac.aleo/address_check(recipient);

        // TODO: Fill in here
    }

    async function mint_public_onchain(
        public recipient: address, 
        public amount: u64,
        public address_check : Future
    ) {
        address_check.await();

        // TODO: Fill in here
    }





    /*
    ====================================================================================================================
    TASK 2: Mint (Private)

    This feature mints new tokens by initializing a new record with the specified amount of tokens for the recipient.
    
    TODOs: 
        `mint_private`:
            1. Query the `address_check` function in `workshop_ofac.aleo` with the `recipient` field
            2. Initialize a Token record with the `recipient` as the owner and the `amount` as the amount
            3. Return the Token record and pass the Future to the `mint_private_onchain` function

        `mint_private_onchain`:  
            1. Await the `address_check` Future
    
    ====================================================================================================================  
    */
    async transition mint_private(
        private recipient: address, 
        private amount: u64
    ) -> (Token,Future) {
        // TODO: Fill in here

    }
    async function mint_private_onchain(
        address_check : Future
    ){
        // TODO: Fill in here
    }





    /*
    ====================================================================================================================
    TASK 3: Transfer (Public)

    This feature publicly transfers tokens between two users by deducting the transfer amount from the sender's balance
    in the public mapping and adding the same value to the recipient's balance
    
    TODO:
        `transfer_public`:
            1. Query the `address_check` function in `workshop_ofac.aleo` with the `recipient` field
            2. Pass the returned Future and other appropriate fields to the `transfer_public_onchain` function
                - For the `sender` field, you can use `self.signer` to specify the address that initialized the function call

        `transfer_public_onchain`:
            1. Await the `address_check` Future
            2. Set the value for `sender` in the `balances` mapping to the sender's current value minus `amount` 
            3. Set the value for `recipient` in the `balances` mapping to the recipient's current value plus `amount` 
    
    ====================================================================================================================  
    */
    async transition transfer_public(
        public recipient: address, 
        public amount: u64
    ) -> Future {
        // TODO: Fill in here
    }
    async function transfer_public_onchain(
        public sender: address, 
        public recipient: address, 
        public amount: u64,
        public address_check : Future
    ) {
        // TODO: Fill in here
    }





    /*
    ====================================================================================================================
    TASK 4: Transfer (Private)

    This feature privately transfers tokens between two users by consuming the sender's Token record and producing two 
    new Token records.  The first is a Token record for the recipient with the amount sent, and the second is a new Token 
    record for the sender with the leftover amount.
    
    TODO:
        `transfer_private:
            1. Query the `address_check` function in `workshop_ofac.aleo` with the `recipient` field
            2. Initialize a Token record with the `recipient` as the owner and the `amount` as the amount
            3. Initialize a Token record with the `sender` as the owner and the remaining balance as the amount
            4. Return both Token records and pass the Future to the `mint_private_onchain` function

        `transfer_private_onchain`:
            1. Await the `address_check` Future
    
    
    ====================================================================================================================  
    */
    async transition transfer_private(
        private sender: Token, 
        private recipient: address, 
        private amount: u64
    ) -> (Token, Token, Future) {
        // TODO: Fill in here
    }

    async function transfer_private_onchain(
        public address_check : Future
    ){
        // TODO: Fill in here
    }





    /*
    ====================================================================================================================
    BONUS TASKS:

    For those looking for an extra challenge, implement the following additional functions:
        - transfer_private_to_public()
        - transfer_public_to_private()

    Additionally, in practice you'll likely want to have some advanced functionality, such as allowing authorized users and programs
    to manage your funds:
        - approve_public [will require an additional `allowances` mapping]
        - approve_private
        - transfer_from() [Aleo only supports public transfer_from due to how records are implemented]
        - burn_public()
        - burn_private()


    Don't forget to include OFAC compliance checks!
    
    ====================================================================================================================  
    */
}
