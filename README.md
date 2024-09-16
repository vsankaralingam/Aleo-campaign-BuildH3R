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

[Fork this repo](https://github.com/vsankaralingam/Aleo-campaign-BuildH3R.git) to get started.

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

 ## The First Bid

Have the first bidder place a bid of 10. 

Swap in the private key and address of the first bidder to `.env`.

```bash
echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpCd9KfAYUjjt5DBDY6gEiwsY7cgdZpwAZ863iHZw2ZpjJ
ENDPOINT=https://api.explorer.provable.com/v1
" > .env
```

Call the `place_bid` program function with the first bidder and `10u64` arguments.

```bash
leo run place_bid aleo1gwjap0ql7axvtl2z2jc8eskye0ru77tqf4zmysug8szx067rgqgsf3ysx6 --network testnet
```

## The Second Bid

Have the second bidder place a bid of 90.

Swap in the private key of the second bidder to `.env`.

```bash
echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpFtv6PSzx8GYgrUNbLJRvVFyfHQyd7bLoKGvMEMq4Paw9
ENDPOINT=https://api.explorer.provable.com/v1
" > .env
```

Call the `place_bid` program function with the second bidder and `90u64` arguments.

```bash
leo run place_bid aleo1rz8akajyrmz57ar6r39anauw42fxm5kkatwkm4sxdu035swyxyysdphhca 9u64 --network testnet
```
![image](https://github.com/user-attachments/assets/6a5ca991-9164-4934-9139-aa013e2f6e33)

## Step 3: Select the Winner

Have the auctioneer select the winning bid.

Swap in the private key of the auctioneer to `.env`.

```bash
echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp3fPieKf723Es779d4VGrcGK94wGhfvm6AiaAuP16a71u
ENDPOINT=https://api.explorer.provable.com/v1
" > .env
```

Provide the two `Bid` records as input to the `resolve` transition function.

```bash 
 leo run resolve "{
  owner: aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl.private,
  bidder: aleo1gwjap0ql7axvtl2z2jc8eskye0ru77tqf4zmysug8szx067rgqgsf3ysx6.private,
  amount: 11u64.private,
  is_winner: false.private,
  _nonce: 1954135135404140564916517997808782776661568994681110724070659566819130079333group.public
}" "{
  owner: aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl.private,
  bidder: aleo1rz8akajyrmz57ar6r39anauw42fxm5kkatwkm4sxdu035swyxyysdphhca.private,
  amount: 9u64.private,
  is_winner: false.private,
  _nonce: 6290155981947508331292576007861658926309592807182725723330418403565256573454group.public
}" --network testnet
```
![image](https://github.com/user-attachments/assets/43f13369-c06e-460c-92f0-394355f1084b)

## Step 4: Finish the Auction

Call the `finish` transition function with the winning `Bid` record.

```bash 
leo run finish "{
  owner: aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl.private,
  bidder: aleo1gwjap0ql7axvtl2z2jc8eskye0ru77tqf4zmysug8szx067rgqgsf3ysx6.private,
  amount: 11u64.private,
  is_winner: false.private,
  _nonce: 1460812918611587634891459256611043619250501694318610170039107019259134344784group.public
}"  --network testnet
```
![image](https://github.com/user-attachments/assets/ad2ee017-02c3-4e0f-98fd-ed1be5ce6f7e)


## Step 4: let's depoly 

 ```bash
 leo deploy --network testnet
```
![image](https://github.com/user-attachments/assets/cadeb6cd-b997-4810-a661-61069d757a90)

[depolyed program](https://testnet.aleo.info/program/finalprogram.aleo)

