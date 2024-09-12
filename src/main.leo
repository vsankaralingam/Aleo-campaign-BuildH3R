// The `program` scope defines the data types, functions, and state associated with the `auction` program.
program prizeonmoney_buildh3r.aleo {

    // A bid in an auction.
    // - `owner`     : The address of the account that owns the record associated with this bid.
    // - `bidder`    : The address of the account that placed the bid.
    // - `amount`    : The amount of the bid.
    // - `is_winner` : Whether the bid is the winning bid.
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    // A prize in the auction.
    // - `owner` : The address of the account that won the auction.
    // - `amount`: The amount of the winning bid.
    record Prize {
        owner: address,
        amount: u64,
    }

    // Returns a new bid.
    // - `bidder` : The address of the account that placed the bid.
    // - `amount` : The amount of the bid.
    // Requires that `bidder` matches the function caller.
    // The owner of the record is set to the entity responsible for running the auction (auction runner).
    // The address of the auction runner is aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.
    transition place_bid(bidder: address, amount: u64) -> Bid {
        // Ensure the caller is the auction bidder.
        assert_eq(self.caller, bidder);

        // Return a new 'Bid' record for the auction bidder.
        return Bid {
            owner: aleo1jy0ts7f6s73t9vq7ceddswzdnemtscefnequ72vagvz0qsvenyxsqqjecl,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    // Returns the winning bid.
    // - `first`  : The first bid.
    // - `second` : The second bid.
    // Requires that the function caller is the auction runner.
    // Assumes that the function is invoked only after the bidding period has ended.
    // In the event of a tie, the first bid is selected.
    transition resolve(first: Bid, second: Bid) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1jy0ts7f6s73t9vq7ceddswzdnemtscefnequ72vagvz0qsvenyxsqqjecl);

        // Resolve the winner of the auction.
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    // Returns ownership of the bid to the bidder.
    // - `bid` : The winning bid.
    // Requires that the function caller is the auction runner.
    // Assumes that the function is invoked only after all bids have been resolved.
    transition finish(bid: Bid) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1jy0ts7f6s73t9vq7ceddswzdnemtscefnequ72vagvz0qsvenyxsqqjecl);

        // Return 'is_winner' as 'true' in the winning 'Bid'.
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }

    // Claims the prize for the winning bid.
    // - `bid` : The winning bid.
    // Requires that the function caller is the auction runner.
    // Assumes that the function is invoked only after the winning bid is finalized.
    transition claim(bid: Bid) -> Prize {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1jy0ts7f6s73t9vq7ceddswzdnemtscefnequ72vagvz0qsvenyxsqqjecl);

        // Check if the bid is the winning bid.
        assert_eq(bid.is_winner, true);

        // Create and return a new Prize record with the winner's address and bid amount.
        return Prize {
            owner: bid.bidder,
            amount: bid.amount,
        };
    }
}
