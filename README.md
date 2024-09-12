# Private Auction Program using Leo on aleo blockchain

## Summary

This project implements a first-price sealed-bid auction in Leo for the Aleo blockchain. In a sealed-bid auction, each participant submits a bid without knowing the bids of others. The highest bid wins the auction.

### Key Parties

- **Bidder**: A participant who submits a bid.
- **Auctioneer**: The entity responsible for managing and resolving the auction.

### Assumptions

- The auctioneer is assumed to be honest and will resolve bids correctly without tampering.
- There is no limit on the number of bids.
- Bidders do not know other participants' bids or identities.

### Auction Flow

1. **Bidding**: Participants place bids using the `place_bid` function.
2. **Resolution**: The auctioneer resolves the bids using the `resolve` function to determine the winning bid.
3. **Finishing**: The auctioneer finalizes the auction with the `finish` function.
4. **Claiming**: The winning bidder claims the prize using the `claim` function.

### Language Features and Concepts

- **Record Declarations**: Define `Bid` and `Prize` structures.
- **Assertions**: Validate conditions using `assert_eq`.
- **Record Ownership**: Manage and verify ownership of records.

## How to Run

### Prerequisites

1. **Install Leo**: Follow the [Leo installation instructions](https://gist.github.com/laishawadhwa/0a47aa94cccf4206b079cf814604b6ef).

### Running the Program

The auction program can be executed using the provided bash script. Ensure your environment is correctly set up with the necessary private keys and addresses.

2. **Clone that repo**

3. **Navigate to the Project Directory**:

    ```bash
    cd Aleo-campaign-BuildH3R  
    ```
    
           
4. **Run the Script**:

    ```bash
    ./run.sh
    ```

    This script will execute the Leo program functions to conduct, bid, and finalize the auction.

### Environment Configuration

The `.env` file contains the private key and address used for signing transactions. Update this file as needed:

```bash
NETWORK=testnet3
PRIVATE_KEY=<your_private_key>
