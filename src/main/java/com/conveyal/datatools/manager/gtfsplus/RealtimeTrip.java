package com.conveyal.datatools.manager.gtfsplus;

import com.conveyal.gtfs.model.Entity;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RealtimeTrip extends Entity {

    private static final long serialVersionUID = 1L;

    public String trip_id;
    public String realtime_trip_id;

    @Override
    public void setStatementParameters(PreparedStatement statement, boolean setDefaultId) throws SQLException {
        throw new UnsupportedOperationException(
            "Cannot call setStatementParameters because loading a GTFS+ table into RDBMS is unsupported.");
    }
}
