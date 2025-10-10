
graph KenyaMap {
    node Thika {
        has name: str = "Thika";
    }

    node Nairobi {
        has name: str = "Nairobi";
    }

    node Nakuru {
        has name: str = "Nakuru";
    }

    edge Thika -> Nairobi;
    edge Nairobi -> Nakuru;
}

walker DeliveryAgent {
    has current_location: str;

    can move {
        visit ->;
        current_location = here.name;
        report "📦 Moved to " + current_location;
    }

    can deliver {
        report "✅ Delivered package at " + current_location;
    }

    with entry {
        current_location = "Thika";
        move;
        deliver;
        move;
        deliver;
    }
}
