module MyModule::MicroInsurance {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct InsurancePool has store, key {
        owner: address,       // Owner of the insurance pool
        total_funds: u64,     // Total funds in the pool
        claim_threshold: u64, // Minimum amount required for a claim
    }

    /// Function to create a new insurance pool.
    public fun create_pool(owner: &signer, claim_threshold: u64) {
        let pool = InsurancePool {
            owner: signer::address_of(owner),
            total_funds: 0,
            claim_threshold,
        };
        move_to(owner, pool);
    }

}
