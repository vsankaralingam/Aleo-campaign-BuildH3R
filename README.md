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

 **Install Leo**: Follow the [Leo installation instructions](https://gist.github.com/laishawadhwa/0a47aa94cccf4206b079cf814604b6ef).

### Step 1: Fork this Repository

[Fork this repo](#) to get started. (Link will be added soon.)

### Step 2: Create Accounts for Auctioneer and Bidders

Using [Aleo tools](https://www.provable.tools/), we will create three accounts:
- **1 Auctioneer account**
- **2 Bidder accounts**

Make sure to obtain credits from the aleo faucet discord [puzzle-server](https://discord.gg/rXQyKHzE) [leo-server](https://discord.gg/Ra9bkaQ4) to fund these accounts.

### Step 3: Clean Up the Cloned Folder and Update Configurations

1. Navigate to the auction folder:
   ```bash
   cd auction
   

2. Delete the `build` Folder and Update the `.env` File

i). **Delete the `build` Folder**

   Inside the `auction` directory, remove the existing `build` folder to ensure that any old build artifacts do not interfere with your setup. Run the following command:
   ```bash
   rm -rf build
   ```

 ii). **Open the .env file in the auction directory and update it with the following content**
  ```bash
   NETWORK=testnet
   PRIVATE_KEY=<your_private_key>
   ENDPOINT=https://api.explorer.provable.com/v1

   ```
### Change the Program Name

iii). **Update the `main.leo` File**

   - Open the `main.leo` file located in the `auction` directory.
   - At the beginning of the file, update the program name to your preferred name. Ensure the name is 8 to 10 characters long to avoid credit issues.

   **Example:**
   If the original line is:
   ```leo
   program auction.aleo
   ```

  ##  **Change:**
   
  ```bash
     program your_preferred_name.aleo
  ```
 
