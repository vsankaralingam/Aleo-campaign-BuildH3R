program finalprogram.aleo {

    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }


    record Prize {
        owner: address,
        amount: u64,
    }

    transition place_bid(bidder: address, amount: u64) -> Bid {
    
        assert_eq(self.caller, bidder);

        
        return Bid {
            owner: aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {
    
        assert_eq(self.caller, aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl);

    
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    
    transition finish(bid: Bid) -> Bid {

        assert_eq(self.caller, aleo19ccxqucv6fyuz6qzdq06vhtj9xxgf0vnwnktzwxyvnugmy8dxvqs3xlqgl);

    
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }

    
    transition claim(bid: Bid) -> Prize {
    
        assert_eq(self.caller, bid.bidder);

        
        assert_eq(bid.is_winner, true);

        
        return Prize {
            owner: bid.bidder,
            amount: 2000u64,
        };
    }
}
